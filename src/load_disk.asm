; DL = drive number (0=A:, 1=2nd floppy, 80h=drive 0, 81h=drive 1)
; DH = number of sectors to read	(1-128 dec.)
; ES:BX = pointer to buffer

; AH = 0x02
; AL = number of sectors to read	(1-128 dec.)
; CH = track/cylinder number  (0-1023 dec., see below)
; CL = sector number  (1-17 dec.)
; DH = head number  (0-15 dec.)
load_disk:
  pusha
  push dx

  mov ah, 0x02
  mov al, dh
  mov ch, 0x00
  mov cl, 0x02
  mov dh, 0x00

  int 0x13
  jc load_disk_error

  pop dx
  cmp al, dh
  jne load_disk_sectors_error

  popa
  ret

  load_disk_error:
    mov bx, DISK_ERROR
    call print
    mov bx, DISK_ERROR_CODE
    call print
    mov al, ah
    mov ah, 0x00
    call print_number
    call print_nl

    jmp $

  load_disk_sectors_error:
    mov bx, DISK_SECTORS_ERROR
    call print
    jmp $

DISK_ERROR: db 'Disk read error!', 10, 0x0D, 0
DISK_ERROR_CODE: db 'Code: ', 0
DISK_SECTORS_ERROR: db 'Incorrect number of sectors read!', 10, 0x0D, 0

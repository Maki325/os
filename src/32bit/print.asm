[bits 32] ; using 32-bit protected mode

; this is how constants are defined
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f ; the color byte for each character

; EBX = string pointer
print32:
  pusha

  mov ah, WHITE_ON_BLACK

  mov edx, VIDEO_MEMORY
  print32_loop:
    mov al, [ebx]
    cmp al, 0
    jz print32_end

    mov [edx], ax
    add ebx, 1
    add edx, 2
  jmp print32_loop

  print32_end:
    popa

ret

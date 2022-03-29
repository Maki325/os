[org 0x7c00]
; A simple boot sector program that loops forever
; mov al, "O"
; call printChar
; mov al, 0x0a
; call printChar

; mov al, [wordLen]
; add al, '0'
; call printChar

mov bx, toPrint
mov dx, [wordLen]
call printWord

jmp $


; Put char into `al`
printChar:
  mov ah, 0x0e
  int 0x10
  ret

printWord:
  pusha
  mov BYTE [wordCount], 0
  mov ah, 0x0e
  printWordLetter:
    cmp [wordCount], dx
    jz printWordEnd
    mov al, [bx]
    int 0x10
    mov al, [wordCount]
    inc al
    mov [wordCount], al
    add bx, 1

  printWordEnd:
      mov al, [wordCount]
      add al, '0'
      call printChar
    popa
    ret

toPrint: db 'Hello, World!'
wordLen: db $-toPrint
wordCount: db 0
times 510-($-$$) db 0
dw 0xaa55


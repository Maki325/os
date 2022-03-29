[org 0x7c00]

mov bx, toPrint
mov dh, [wordLen]
call printWord

mov ax, 134
call printNumber

; mov bp, 0x8000 ; this is an address far away from 0x7c00 so that we don't get overwritten
; mov sp, bp ; if the stack is empty then sp points to bp

; mov al, sp
; add al, '0'
; call printChar

; push 'A'
; push 'B'
; push 'C'


jmp $


; Put char into `al`
printChar:
  mov ah, 0x0e
  int 0x10
ret

printWord:
  pusha
  mov ah, 0x0e
  printWordLetter:
    cmp dh, 0
    jz printWordEnd
    mov al, [bx]
    int 0x10
    dec dh
    add bx, 1
    jmp printWordLetter

  printWordEnd:
    popa
ret

; Put number into `ax`
printNumber:
  pusha
  printNumberDigit:
    mov bl, 10
    div bl ; Quotient: `al`, Remainder: `ah`
    mov bh, al
    mov al, ah
    add al, '0'
    mov ah, 0x0e
    int 0x10
    mov ah, 0
    mov al, bh
    cmp ax, 0
    jz printNumberEnd
    jmp printNumberDigit

  printNumberEnd:
    popa
ret

toPrint: db 'Hello, World!', 10, 0x0D
wordLen: db $-toPrint
wordCount: db 0
times 510-($-$$) db 0
dw 0xaa55



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
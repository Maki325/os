
; Put char into `al`
printChar:
  mov ah, 0x0e
  int 0x10
ret

; Put word into `bx`
; Put word length into `dh`
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
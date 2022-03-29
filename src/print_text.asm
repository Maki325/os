
; Put char into `al`
print_char:
  mov ah, 0x0e
  int 0x10
ret

print_nl:
  mov ah, 0x0E
  mov al, 0x0A
  int 0x10
  mov al, 0x0D
  int 0x10
ret

; Put word into `bx`
print:
print_word:
  pusha
  mov ah, 0x0e
  print_word_letter:
    mov al, [bx]
    cmp al, 0
    jz print_word_end
    int 0x10
    add bx, 1
    jmp print_word_letter

  print_word_end:
    popa
ret

; Put word into `bx`
; Put word length into `dh`
print_word_length:
  pusha
  mov ah, 0x0e
  print_word_length_letter:
    cmp dh, 0
    jz print_word_length_end
    mov al, [bx]
    int 0x10
    dec dh
    add bx, 1
    jmp print_word_length_letter

  print_word_length_end:
    popa
ret
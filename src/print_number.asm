
; Put number into `ax`
print_number:
  pusha

  mov bl, 10
  div bl ; Quotient: `al`, Remainder: `ah`
  mov bl, ah

  mov ah, 0
  cmp ax, 0
  jz print_number_digit_p2
  call print_number
  print_number_digit_p2:

  mov al, bl
  add al, '0'
  mov ah, 0x0e

  int 0x10

  printNumberEnd:
    popa
ret

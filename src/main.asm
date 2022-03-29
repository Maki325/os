[org 0x7c00]

mov bx, toPrint
mov dh, [wordLen]
call printWord

mov ax, 134
call printNumber

jmp $

%include "print_text.asm"
%include "print_number.asm"

toPrint: db 'Hello, World!', 10, 0x0D
wordLen: db $-toPrint
times 510-($-$$) db 0
dw 0xaa55


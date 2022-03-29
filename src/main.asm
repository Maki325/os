[org 0x7c00]

mov bp, 0x8000 ; set the stack safely away from us
mov sp, bp
mov bx, 0x9000 ; es:bx = 0x0000:0x9000 = 0x09000
mov dh, 2 ; read 2 sectors
; the bios sets 'dl' for our boot disk number
; if you have trouble, use the '-fda' flag: 'qemu -fda file.bin'
call load_disk

mov bx, welcomeMessage
call print

mov dx, [0x9000 + 512] ; first word from second loaded sector, 0xface
call print_hex

jmp $

%include "print_text.asm"
%include "print_number.asm"
%include "print_hex.asm"
%include "load_disk.asm"

welcomeMessage: db 'Welcome to MarkOS!', 10, 0x0D, 0
times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes

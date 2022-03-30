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

call switch_to_pm

jmp $

%include "print_text.asm"
%include "print_number.asm"
%include "print_hex.asm"
%include "load_disk.asm"
%include "32bit/print.asm"
%include "32bit/global_descript_table.asm"
%include "32bit/switch.asm"

[bits 32]
BEGIN_PM: ; after the switch we will get here
    mov ebx, welcomeMessage32
    call print32 ; Note that this will be written at the top left corner
    jmp $

welcomeMessage: db 'Welcome to MarkOS!', 10, 0x0D, 0
welcomeMessage32: db 'Welcome to MarkOS 32bit!', 0
times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes

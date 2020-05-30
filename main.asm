[org 0x7c00]            ;set memory origin (boot sector starts at 0x7c00)

mov [BOOT_DRIVE], dl

mov bp, 0x8000      ; Create our stack
mov sp, bp

mov bx, 0x9000      ; load  sectors to 0x000(ES):0x9000(BX) from boot disk
mov dh, 5
mov dl, [BOOT_DRIVE]
call disk_load

mov dx, [0x9000]
call print_hex

mov dx, [0x9000 + 512]
call print_hex

jmp $

%include "print_string.asm"
%include "print_hex.asm"
%include "disk_load.asm"


BOOT_DRIVE: db 0x00

times 510-($-$$) db 0   ;pad the boot sector with zeros
dw 0xaa55               ; last two bytes form the magic number for BIOS to know it's the boot sector


times 256 dw 0xdada
times 256 dw 0xface

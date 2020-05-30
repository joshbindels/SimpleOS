[org 0x7c00]            ;set memory origin (boot sector starts at 0x7c00)


mov dx, 0x1fb6
call print_hex

jmp $                   ;infinite loop, $ means current address

%include "print_string.asm"
%include "print_hex.asm"


times 510-($-$$) db 0   ;pad the boot sector with zeros
dw 0xaa55               ; last two bytes form the magic number for BIOS to know it's the boot sector


mov ah, 0x0e            ;tty mode
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10
mov al, 'o'
int 0x10

jmp $                   ;infinite loop, $ means current address

times 510-($-$$) db 0   ;pad the boot sector with zeros
dw 0xaa55               ; last two bytes form the magic number for BIOS to know it's the boot sector

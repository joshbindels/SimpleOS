[org 0x7c00]            ;set memory origin (boot sector starts at 0x7c00)

mov ah, 0x0e            ;tty mode

mov bp, 0x8000
mov sp, bp

push 'A'
push 'B'
push 'C'

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

mov al, [0x7ffe]
int 0x10



jmp $                   ;infinite loop, $ means current address


times 510-($-$$) db 0   ;pad the boot sector with zeros
dw 0xaa55               ; last two bytes form the magic number for BIOS to know it's the boot sector

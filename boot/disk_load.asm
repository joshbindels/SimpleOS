disk_load:
    push dx     ; number of sectors to be read

    mov ah, 0x02    ; BIOS read sector function
    mov al, dh      ; Read DH sectors
    mov ch, 0x00    ; Cylinder 0
    mov dh, 0x00    ; Head 0
    mov cl, 0x02    ; Start reading from second sector

    int 0x13        ; BIOS interrupt

    jc disk_error_one

    pop dx
    cmp dh, al      ; if sectors read (al) != expected sectors (dh)
    jne disk_error_two
    ret

disk_error_one:
    mov bx, DISK_ERROR_MSG_1
    call print_string
    jmp $

disk_error_two:
    mov bx, DISK_ERROR_MSG_2
    call print_string
    jmp $

DISK_ERROR_MSG_1: db "Disk read error 1!", 0
DISK_ERROR_MSG_2: db "Disk read error 2!", 0

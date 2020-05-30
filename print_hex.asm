;parameter: dx

print_hex:
    pusha
    mov cx, 0 ;index

hex_loop:
    cmp cx, 4;          ;loop 4 times
    je end_print_hex

    mov ax, dx          ; Use ax as a working register
    and ax, 0x000f      ; Mask first three chars with 0s
    add al, 0x30        ; Ascii numbers start at 0x30
    cmp al, 0x39        ; Ascii numbers end at 0x39
    jle add_digit_to_hexout

    add al, 7         ; Ascii letters start at 0x41 (diff in dec is 7)

add_digit_to_hexout:
    ; bx is going to hold the character that we're trying to print
    ; HEX_OUT + 5 (5 being the length of the string) point to the end of the string
    ; subtract the index from HEX_OUT+5 to point to the current character
    mov bx, HEX_OUT + 5
    sub bx, cx
    mov [bx], al        ; change the value of bx to al
    shr dx, 4           ; 1 char is half a byte, so 4 need to shift right 4 bits

    add cx, 1
    jmp hex_loop


end_print_hex:
    mov bx, HEX_OUT
    call print_string
    popa
    ret

HEX_OUT: db "0x0000", 0

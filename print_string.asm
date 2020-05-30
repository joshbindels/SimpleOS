print_string:
    pusha
    mov ah, 0x0e
    jmp print_each_character ; iterate over the string

print_each_character:
    mov cl, [bx]        ; store value of bx (current character) to cl
    cmp cl, 0
    je print_done
    mov al, [bx]
    int 0x10
    add bx, 0x1
    jmp print_each_character

print_done:
    popa
    ret

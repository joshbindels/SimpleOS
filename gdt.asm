;GDT

; DB - Byte        1 Byte
; DW - Word        2 Bytes
; DD - Double Word 4 Bytes

gdt_start:

gdt_null:   ;Mandatory null descriptor
    dd 0x0
    dd 0x0

gdt_code:   ; code segment descriptor
    ; base=0x0, limit=0xffff
    dw 0xffff       ; Limit bits 0-15
    dw 0x0          ; Base bits 0-15
    db 0x0          ; Base bits 16-23
    db 10011010b    ; present, privilege, descriptor type, code, conforming, readable, accessed
    db 11001111b    ; granularity, 32-bit default, 64-bit seg, avl, limit bits 16-19
    db 0x0          ; Base bits 24-31

gdt_data:   ; Data segment descriptor
    dw 0xffff   ; Limit bits 0-15
    dw 0x0      ; Base bits 0-15
    db 0x0      ; Base bits 16-23
    db 10010010b; present, privilege, descriptor type, code, expand down, writable, accessed
    db 11001111b    ; granularity, 32-bit default, 64-bit seg, avl, limit bits 16-19
    db 0x0

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1 ; Size of GDT
    dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

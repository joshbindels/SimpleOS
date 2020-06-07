[bits 16]
switch_to_pm:
    cli
    lgdt [gdt_descriptor]
    
    mov eax, cr0    ; To switch to pm set first bit of control register cr0
    or eax, 0x1
    mov cr0, eax

    jmp CODE_SEG:init_pm ; far jump to 32-bit code. Forces cpu to flush cache


[bits 32]
init_pm:
    mov ax, DATA_SEG    ; in PM old segments are meaningless, point segment registers to data sector from GDT
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000    ; update stack position
    mov esp, ebp

    call BEGIN_PM

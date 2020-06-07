all: os-image

run: all
	qemu-system-x86_64 -curses -fda os-image

os-image: boot_sect.bin kernel.bin
	cat $^ > $@

kernel.bin: kernel_entry.o kernel.o
	ld -o $@ -m elf_i386 -Ttext 0x1000 $^ --oformat binary

kernel.o: kernel.c
	gcc -ffreestanding -m32 -fno-pie -c $< -o $@

kernel_entry.o: kernel_entry.asm
	nasm $< -f elf -o $@

boot_sect.bin: main.asm
	nasm -f bin $< -o $@

clean:
	rm -rf *.bin *.o *.dis os-image *.map

kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@


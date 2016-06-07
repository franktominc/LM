
all:
	nasm -f elf64 challenge.asm
	ld -s -dynamic-linker /lib64/ld-linux-x86-64.so.2 challenge.o -lc -o challenge.x
clean:
	rm *.o
	rm *.x

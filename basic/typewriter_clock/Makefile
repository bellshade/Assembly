all: typewriter_clock

typewriter_clock: typewriter_clock.asm
	nasm -f elf32 typewriter_clock.asm -o typewriter_clock.o
	ld -m elf_i386 typewriter_clock.o -o typewriter_clock

clean:
	rm -f *.o typewriter_clock

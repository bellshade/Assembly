FILENAME=fileLain
run_testing:
	nasm -f elf $(FILENAME).asm
	ld -m elf_i386 $(FILENAME).o -o $(FILENAME)
	-./$(FILENAME)
	rm -f $(FILENAME).o
	rm -f $(FILENAME)
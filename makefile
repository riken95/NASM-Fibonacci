nom = fibonacci
all: clean
	nasm -f elf $(nom).asm
	gcc -m32 -o $(nom) $(nom).o -lc
	./$(nom)


clean:
	rm -f $(nom).o
	rm -f $(nom)

nom = fibonacci
all: clean
	nasm -f elf $(nom).asm
	gcc -m32 -o $(nom) $(nom).o -lc -no-pie
	./$(nom)


clean:
	rm -f $(nom).o
	rm -f $(nom)

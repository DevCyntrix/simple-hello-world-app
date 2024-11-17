all: build-asm build-static-c build-dyn-c

build-asm:
	@echo "Building assembly version..."
	as main.s -o main.o && gcc -o main-asm main.o -nostdlib -static
	rm main.o

build-static-c:
	@echo "Building static-c version..."
	gcc -o main-static-c main.c -static

build-dyn-c:
	@echo "Building dynamic-c version..."
	gcc -o main-dyn-c main.c

clean:
	rm main-static-c main-dyn-c main-asm


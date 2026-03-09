CC=gcc
TARGET=myos # Target executable name
C_FILES=./kernel.c # Source files for the kernel
OBJS=$(C_FILES:.c=.o) # Object files derived from source files, replacing .c with .o. It is the kernel.c

all compile: $(TARGET)
all: finale
.PHONY: all compile clean finale # Declares these targets as phony, meaning they are not actual files but merely targets for actions defined in the Makefile.

%.o:
	$(CC) -c $(@:.o=.c) -o $@ -ffreestanding -fno-exceptions -m32 # compile kernel.c -> kernel.o

$(TARGET): $(OBJS)
	$(shell nasm -f elf start.asm -o start.o) # compile start.asm -> start.o. At the moment, we do not use boot.asm.
	$(CC) -m32 -nostdlib -nodefaultlibs -lgcc start.o $? -T linker.ld -o $(TARGET) # Generate myos

finale:
	$(shell cd ~/Desktop/my_os/)
	$(shell cp $(TARGET) ./iso/boot/myos) # copy myos to ./iso/boot/myos
	$(shell grub2-mkrescue iso --output=myos.iso) # grub2-mkrescue utility to generate an iso file that we will use

clean: # It is optional in the line: all: finale clean. It clean and survive the myos.iso
	rm -f *.o $(TARGET) ./iso/boot/$(TARGET) # rm: remove *.o, myos, ./iso/boot/myos
	find . -name \*.o | xargs —no-run-if-empty rm

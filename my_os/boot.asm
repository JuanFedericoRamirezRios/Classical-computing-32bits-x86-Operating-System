bits 32 ;notifying the NASM compiler that it should compile this code for 32-bit
global _start ; linker <- Begins
extern kernel_early ; ;“kernel_early” procedure can be found in an “EXTERNAL” file.
extern main ;“main” procedure can be found in an “EXTERNAL” file. This is the entry point. we can actually rename the main

section .text ;  to perform operations, you will need to define them in a section called “.text”.
    align 4 ; alignment of the instruction or data immediately after this. 4 bytes = 32 bits <- Max. value.
    dd 0x1BADB002  ; dd: double-word (4 bytes). 0x1BADB002: “magic” field that is required by GRUB.
    dd 0x00 ; Zero flags
    dd - (0x1BADB002 + 0x00) ; checksum
_start: ; Function _start
    cli ;  disable (or clear) interrupts. Avoid that other instructions awake the CPU
    mov esp, stack ; stack -> ESP (Pointing to memory addresses) allocate some memory for the stack and point the stack pointer (esp) to it.
    call kernel_early
    call main ; call the main in an EXTERNAL file
    hlt ; halt for the moment, Later on we will omit this instruction.

section .bss ; In this section define the variables.
resb 8192 ;reserve bytes: 8KB for our stack
stack: ; Empty function

; Compile: nasm -f elf32 start.asm -o start.o ; -f elf32: Flag elf32 (Executable and Linkable Format 32 bits)

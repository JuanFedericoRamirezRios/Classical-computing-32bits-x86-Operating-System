bits 32 ;notifying the NASM compiler that it should compile this code for 32-bit
global _start ; linker <- Begins
extern main ;“main” procedure can be found in an “EXTERNAL” file. This is the entry point. we can actually rename the main

section .text ;  to perform operations, you will need to define them in a section called “.text”.
_start: ; Function _start
    cli ;  disable (or clear) interrupts. Avoid that other instructions awake the CPU
    mov esp, stack ; stack -> ESP (Pointing to memory addresses) allocate some memory for the stack and point the stack pointer (esp) to it.
    call main ; call the main in an EXTERNAL file
    hlt ; halt for the moment, Later on we will omit this instruction.
section .bss ; In this section define the variables.
resb 8192 ;reserve bytes: 8KB for our stack
stack: ; Empty function




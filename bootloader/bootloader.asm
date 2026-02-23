bits 16 ; 16-bit mode as opposed to the 32-bit mode the rest of our operating system will be running in.

start:
    mov ax, 0x07c0 ;
    add ax, 0x20
    mov ss, ax
    mov sp, 4096
    
    mov ax, 0x07c0
    mov ds, ax
    
    mov si, msg
    call print
    cli
    hlt
data:
    msg db 'Hello world!', 0
print:
    mov ah, 0x0e
.printchar:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .printchar
.done:
    ret
times 510 - ($ - $$) db 0
dw 0xaa55

; Compile: nasm -f bin -o bootloader.img bootloader.asm







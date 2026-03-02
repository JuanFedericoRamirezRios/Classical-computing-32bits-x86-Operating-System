static char* const VGA_MEMORY = (char*)0xb8000; //0xb8000 in protected mode for color monitors. char* <- text buffer.
static const int VGA_WIDTH = 80; //Buffer: each line with 80 ascii chars.
static const int VGA_HEIGHT = 25; //Buffer: 25 lines.

void kernel_early(void) { // call kernel_early from boot.asm.

}
int main(void) { //Entry point into all applications.
    const char* hi = "Hell world";

    unsigned int vb = 0; // place holder for video buffer position
    unsigned int n = 0; // place holder for text string position
    while(hi[n] != '\0') { // '\0': null in C.
        VGA_MEMORY[vb] = hi[n];
        VGA_MEMORY[vb+1] = 0x05; //0x05: Format of the char. 5 -> Magenta color.
        n++;
        vb = vb + 2; // Give a byte extra for the format of each char.
    }
    return 0; // W/o any abnormalities.
}

/**
 * Compile: gcc -c kernel.c -o kernel -ffreestanding -m32. -ffreestanding:  standard C library may not exist and that the entry point may not necessarily by located at main. -m32: 32-bit acchitecture.
 **/


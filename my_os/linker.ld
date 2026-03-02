ENTRY(_start) /*Entry point*/
SECTIONS /*Sections listed in boot.asm*/
{
    .= 0x10000000; /*kernel is always loaded into physical address 0x10000000. .= represents the location counter which is always initialized to 0x0*/
    .text: {*(.text)} /* (*) locate any executable code (.text) from all input files */
    .bss: {*(.bss)}  /*In this sections(*) define the changeable variables*/
}

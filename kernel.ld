ENTRY( _entry )

SECTIONS
{
    .text :  {
        *(.entry)
        *(.text)
    }
    .rodata : { *(.rodata) }
    .data : { *(.data) }
    . = ALIGN(0x8);
    bss_begin = .;
    .bss : { *(.bss*) }
    bss_end = .;
}

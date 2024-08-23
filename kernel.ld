ENTRY( _entry )

SECTIONS
{
    .text :  {
        *(.entry)
        *(.text .text.*)
    }
    .rodata : { *(.rodata .rodata.*) }
    .data : { *(.data .data.*) }
    . = ALIGN(0x8);
    _bss_begin = .;
    .bss : { *(.bss*) }
    _bss_end = .;
}

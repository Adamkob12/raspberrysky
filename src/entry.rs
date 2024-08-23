use aarch64_cpu::asm::wfe;

use crate::start::_start;
use core::arch::asm;

#[link_section = ".entry"]
#[no_mangle]
pub unsafe extern "C" fn _entry() -> ! {
    asm!("mrs x0, mpidr_el1");
    asm!("and x0, x0, #0xFF");
    asm!("cbz x0, master");
    loop {
        wfe()
    }
}

#[no_mangle]
pub unsafe extern "C" fn master() -> ! {
    // Clear the bss section
    asm!("adr x0, _bss_begin");
    asm!("adr x1, _bss_end");
    asm!("sub x1, x1, x0");
    asm!("bl memzero");
    // Setup the stack pointer
    asm!("adr x2, MASTER_STACK");
    asm!("add x2, x2, #{}", const crate::mem::STACK_SIZE);
    asm!("mov sp, x2");
    _start()
}

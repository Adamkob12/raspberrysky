#![no_std]
#![no_main]
#![feature(asm_const)]

pub mod entry;
pub mod mem;
pub mod param;
pub mod start;
use aarch64_cpu::*;
use asm::wfe;

#[no_mangle]
extern "C" fn main() -> ! {
    loop {
        wfe();
    }
}

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}

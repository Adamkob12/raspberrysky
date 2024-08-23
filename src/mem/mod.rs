pub mod util;

pub const KB: usize = 1024;

pub const PAGE_SIZE: usize = 4 * KB;

pub const PAGES_PER_STACK: usize = 50;

pub const STACK_SIZE: usize = PAGE_SIZE * PAGES_PER_STACK;

#[no_mangle]
pub static mut MASTER_STACK: [u8; STACK_SIZE] = [0; STACK_SIZE];

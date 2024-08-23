use core::arch::asm;

/// Set the memory in [start, start+size] to 0
///
/// # Safety
/// - The caller must ensure that this write doesn't result in UB
/// - `size` (in bytes) must be divisible by 8
#[no_mangle]
pub unsafe extern "C" fn memzero(_start: usize, _size: usize) {
    // Store 0 (64 bytes of 0) in [x0] and increment x0 by 8
    asm!("str xzr, [x0], #8");
    // We just wrote 8 bytes, so subtract 8 from size and update the condition flag
    asm!("subs x1, x1, #8");
    // If x1 was bigger than 8, continue writing
    asm!("b.gt memzero");
    asm!("ret");
}

// pub static STACKS

use crate::main;

#[no_mangle]
pub extern "C" fn _start() -> ! {
    main()
}

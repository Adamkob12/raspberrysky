use crate::start::_start;

#[link_section = ".entry"]
#[no_mangle]
pub unsafe extern "C" fn _entry() -> ! {
    _start()
}

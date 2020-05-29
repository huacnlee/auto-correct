#![feature(libc)]
#![feature(test)]

use std::ffi::{CStr,CString};

#[no_mangle]
pub fn c_format(c_text: *const libc::c_char) -> *const libc::c_char {
    let text_cstr = unsafe { CStr::from_ptr(c_text) };
    let out = autocorrect::format(text_cstr.to_str().unwrap());
    let result = CString::new(out).unwrap();  // std::ffi::c_str::CString
    result.into_raw() // const i8
}

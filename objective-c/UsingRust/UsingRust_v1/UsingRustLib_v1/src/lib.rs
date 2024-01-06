#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

use std::ffi::CString;
use std::os::raw::c_char;

#[no_mangle]
pub extern "C" fn fStringFromRustLibrary() -> *const c_char {

	let oOutput: CString = CString::new("String from Rust library").unwrap();
	return oOutput.into_raw();
}

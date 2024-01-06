#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

use std::ffi::{c_char, CStr};
use UsingRustLib_v1::*;

fn main() {

	println!("Testing availability from Rust native application");

	let oStringPtr: *const c_char = fStringFromRustLibrary();
	let oCstring: &CStr = unsafe {CStr::from_ptr(oStringPtr)};

	println!("Data: {:?}",oCstring);
}
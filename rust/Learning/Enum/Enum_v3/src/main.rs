#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

#[repr(u8)]
#[derive(Debug)]
enum A_ENUM {
	UNIT,
	TUPLE(bool),
	STRUCT { a: bool },
}

fn main() {
    println!("Hello, world!");
}

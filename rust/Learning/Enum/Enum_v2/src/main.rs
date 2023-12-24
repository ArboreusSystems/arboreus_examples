#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

use std::mem;

enum A_ENUM {
	A(&'static str),
	B(i32),
	C(i32)
}

fn main() {

	println!("A_ENUM::A(\"bar\") {:?}",mem::discriminant(&A_ENUM::A("bar")));
	println!("A_ENUM::A(\"baz\") {:?}",mem::discriminant(&A_ENUM::A("baz")));

	println!("A_ENUM::B(1) {:?}",mem::discriminant(&A_ENUM::B(1)));
	println!("A_ENUM::B(2) {:?}",mem::discriminant(&A_ENUM::B(2)));
	println!("A_ENUM::B(3) {:?}",mem::discriminant(&A_ENUM::B(3)));

	println!("A_ENUM::C(3) {:?}",mem::discriminant(&A_ENUM::C(3)));

    println!("Enum_v3");
}

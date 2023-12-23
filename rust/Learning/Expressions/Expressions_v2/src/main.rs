#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

extern crate num;
#[macro_use]
extern crate num_derive;

use rand::Rng;

#[derive(FromPrimitive)]
#[derive(PartialEq)]
enum A_GOODS {
	APPLE = 1,
	BREAD = 2,
	ORANGE = 3,
	BEEF = 4,
	PORK = 5,
	JUICE = 6
}

fn fRandomNumber() -> u32 {

	let mut iNumber: u32 = rand::thread_rng().gen_range(0..10);
	return iNumber;
}

fn fHandle(inStr:&str) -> String {

	let oOutput: String = String::from(inStr);
	return oOutput;
}

fn main() {

	let oGoods = num::FromPrimitive::from_u32(fRandomNumber());
	let oDescription: String = if oGoods == Some(A_GOODS::APPLE) {
		fHandle("APPLE")
	} else if oGoods == Some(A_GOODS::BREAD) {
		fHandle("BREAD")
	} else if oGoods == Some(A_GOODS::ORANGE) {
		fHandle("ORANGE")
	} else if oGoods == Some(A_GOODS::BEEF) {
		fHandle("BEEF")
	} else if oGoods == Some(A_GOODS::PORK) {
		fHandle("PORK")
	} else if oGoods == Some(A_GOODS::JUICE) {
		fHandle("JUICE")
	} else {
		fHandle("UNDEFINED")
	};

	println!("Description: {}",oDescription);
    println!("Expressions_v2");
}

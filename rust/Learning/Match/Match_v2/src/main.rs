#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

extern crate num;
#[macro_use]
extern crate num_derive;

use rand::Rng;

#[derive(FromPrimitive)]
enum A_GOODS {
	APPLE = 1,
	BREAD = 2,
	ORANGE = 3,
	BEEF = 4,
	PORK = 5,
	JUICE = 6
}

fn fRandomNumber() -> u32 {

	let mut iNumber: u32 = rand::thread_rng().gen_range(1..10);
	return iNumber;
}

fn main() {

	let oGoods = num::FromPrimitive::from_u32(fRandomNumber());
	match oGoods {
		Some(A_GOODS::APPLE) => println!("APPLE"),
		Some(A_GOODS::BREAD) => println!("BREAD"),
		Some(A_GOODS::ORANGE) => println!("ORANGE"),
		Some(A_GOODS::BEEF) => println!("BEEF"),
		Some(A_GOODS::PORK) => println!("PORK"),
		Some(A_GOODS::JUICE) => println!("JUICE"),
		None => println!("Unknown goods")
	}

    println!("Match_v2");
}

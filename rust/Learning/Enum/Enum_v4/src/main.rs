#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

#[repr(u8)]
#[derive(Debug)]
enum A_ENUM {
	A = 0,
	B = 1,
	C = 10,
	D = 3
}

impl A_ENUM {

	fn mDiscriminant(&self) -> u8 {

		unsafe { *<*const _>::from(self).cast::<u8>() }
	}
}

fn main() {

	let oEnumA = A_ENUM::A;
	println!("Enum: {:?} Discriminant: {}", oEnumA, oEnumA.mDiscriminant());

	let oEnumB = A_ENUM::B;
	println!("Enum: {:?} Discriminant: {}", oEnumB, oEnumB.mDiscriminant());

	let oEnumC = A_ENUM::C;
	println!("Enum: {:?} Discriminant: {}", oEnumC, oEnumC.mDiscriminant());

	let oEnumD = A_ENUM::D;
	println!("Enum: {:?} Discriminant: {}", oEnumD, oEnumD.mDiscriminant());

	println!("Enum_v4");
}

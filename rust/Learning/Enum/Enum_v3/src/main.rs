#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

#[repr(u8)]
#[derive(Debug)]
enum A_ENUM {
	UNIT,
	TUPLE(bool),
	STRUCT { a: bool },
}

impl A_ENUM {

	fn mDiscriminant(&self) -> u8 {

		unsafe { *<*const _>::from(self).cast::<u8>() }
	}
}

fn main() {

	let oEnumUnit = A_ENUM::UNIT;
	assert_eq!(0, oEnumUnit.mDiscriminant());
	println!("Enum: {:?} Discriminant: {}", oEnumUnit, oEnumUnit.mDiscriminant());

	let oEnumTuple = A_ENUM::TUPLE(true);
	assert_eq!(1, oEnumTuple.mDiscriminant());
	println!("Enum: {:?} Discriminant: {}", oEnumTuple, oEnumTuple.mDiscriminant());

	let oEnumStruct = A_ENUM::STRUCT { a: false };
	assert_eq!(2, oEnumStruct.mDiscriminant());
	println!("Enum: {:?} Discriminant: {}", oEnumStruct, oEnumStruct.mDiscriminant());

	println!("Enum_v3");
}

#![allow(non_snake_case)]

fn fDumpVariable<Type: std::fmt::Display + std::fmt::Debug>(inObject:Type) {

	println!("inObject: {:#?} type: {}",inObject,std::any::type_name::<Type>());
}

fn main() {

	let oNumber = 100; fDumpVariable(oNumber);
	let oString = "String"; fDumpVariable(oString);
	let oFloat = 0.1; fDumpVariable(oFloat);

	println!("Generic_v1");
}


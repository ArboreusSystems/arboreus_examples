#![allow(non_snake_case)]

fn fTypeOf<Type>(_: &Type) -> &'static str {

	std::any::type_name::<Type>()
}

fn main() {

	let oInteger = 42;
	println!("oInteger: {}", fTypeOf(&oInteger));

	let oFloat = 3.14;
	println!("oFloat: {}", fTypeOf(&oFloat));

	let oStringLiteral = "DataTypes";
	println!("oStringLiteral: {}", fTypeOf(&oStringLiteral));

	let oString = String::from("DataTypes");
	println!("oString: {}", fTypeOf(&oString));

	let oTuple = (42, 3.14, "DataTypes");
	println!("oTuple: {}", fTypeOf(&oTuple));

	let oArray = [1, 2, 3, 4, 5];
	println!("oArray: {}", fTypeOf(&oArray));

	let oVector = vec![1, 2, 3, 4, 5];
	println!("oVector: {}", fTypeOf(&oVector));

    println!("DataTypes v3");
}

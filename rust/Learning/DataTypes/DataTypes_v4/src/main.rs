#![allow(non_snake_case)]

fn fTypeOf<Type>(_: &Type) -> &'static str {

	std::any::type_name::<Type>()
}


fn main() {

	let oNumber1 = 1; println!("oNumber1: {}", fTypeOf(&oNumber1));
	let oNumber2 = 1.0; println!("oNumber2: {}", fTypeOf(&oNumber2));

	// It will cause error
	// let oNumber3 = oNumber2 + oNumber1; println!("oNumber3: {}", fTypeOf(&oNumber3));
	let oNumber3 = oNumber2 + oNumber1 as f64; println!("oNumber3: {}", fTypeOf(&oNumber3));
	let oNumber4 = oNumber2 as i32 + oNumber1; println!("oNumber4: {}", fTypeOf(&oNumber4));

	let oNumber5 = 6; println!("oNumber5: {}", fTypeOf(&oNumber5));
	let oNumber6 = 1.5; println!("oNumber6: {}", fTypeOf(&oNumber6));
	// It will cause error
	// let oNumber7 = oNumber5 / oNumber6;
	let oNumber7 = oNumber5 as f64 / oNumber6; println!("oNumber7: {}", fTypeOf(&oNumber7));

	// It will cause error
	// let oNumber8 = 6 % 2.5; println!("oNumber8: {}", fTypeOf(&oNumber8));
	// let oNumber8 = 6.5 % 2; println!("oNumber8: {}", fTypeOf(&oNumber8));
	let oNumber8 = 6.0 % 2.5; println!("oNumber8: {}", fTypeOf(&oNumber8));
	
    println!("DataTypes v4");
}

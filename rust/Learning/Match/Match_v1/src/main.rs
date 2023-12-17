#![allow(non_snake_case)]

const A_BOOL_INTEGER_TRUE: i32 = 1;
const A_BOOL_INTEGER_FALSE: i32 = 0;

fn main() {

	println!("true: {}",i32::from(true));
	println!("false: {}",i32::from(false));

	let oInteger = 3;
	match oInteger {
		3 => println!("3"),
		_ => println!("any")
	}

	let oBool = true;
	match oBool {
		true => println!("true"),
		false => println!("false")
	}

	let oBoolInteger = 0;
	match oBoolInteger{
		A_BOOL_INTEGER_TRUE => println!("true"),
		A_BOOL_INTEGER_FALSE => println!("false"),
		_ => println!("not_a_boolean")
	}

	let oString = "test";
	match oString {
		"test" => println!("Found text match"),
		_ => println!("Haven't found text match")
	}

    println!("Match v1");
}

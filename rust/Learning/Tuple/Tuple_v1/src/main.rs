#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

enum A_ReplyStatus {
	Undefined,
	Ok,
	Error
}

fn fTestTuple() -> (A_ReplyStatus,String) {

	return (A_ReplyStatus::Ok,String::from("String data from function"));
}

fn main() {

	let oCoordinates = (0.6544,32.6234);
	println!("Coordinates is X: {} Y: {}",oCoordinates.0,oCoordinates.1);

	let oFunction = fTestTuple();
	match oFunction.0 {
		A_ReplyStatus::Undefined => println!("Undefined"),
		A_ReplyStatus::Ok => println!("Ok"),
		A_ReplyStatus::Error => println!("Error")
	}

    println!("Tuple_v1");
}

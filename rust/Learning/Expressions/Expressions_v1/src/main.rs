#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

use rand::Rng;

#[derive(Debug)]
enum A_ReplyStatus {
	Undefined,
	Ok,
	Error
}

fn fRandomStatus() -> A_ReplyStatus {

	let mut oOutput: A_ReplyStatus = A_ReplyStatus::Undefined;
	let mut iNumber: i32 = rand::thread_rng().gen_range(0..10);
	match iNumber {
		0 => oOutput = A_ReplyStatus::Error,
		_ => oOutput = A_ReplyStatus::Ok
	}
	return oOutput;
}

fn fHandleUndefined() -> String {
	
	let oOutput: String = String::from("Undefined");
	return oOutput;
}

fn fHandleOk() -> String {

	let oOutput: String = String::from("Ok");
	return oOutput;
}

fn fHandleError() -> String {

	let oOutput: String = String::from("Error");
	return oOutput;
}

fn main() {

	let oDesription1: String = match fRandomStatus() {
		A_ReplyStatus::Ok => fHandleOk(),
		A_ReplyStatus::Error => fHandleError(),
		A_ReplyStatus::Undefined => fHandleUndefined()
	};
	println!("Description1 : {}",oDesription1);

    println!("Expressions_v1");
}

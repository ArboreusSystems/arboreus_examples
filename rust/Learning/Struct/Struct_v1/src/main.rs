#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

struct A_User {

	FirstName: &'static str,
	LastName: &'static str,
	Description: &'static str,
}

impl Default for A_User {

	fn default() -> A_User {

		A_User {
			FirstName: "NoDefinedName",
			LastName: "NoDefinedName",
			Description: "NoDefinedName"
		}
	}
}

fn main() {

	let mut oUser1 = A_User::default();
	println!(
		"FirstName: {} LastName: {} Description: {}",
		oUser1.FirstName,
		oUser1.LastName,
		oUser1.Description
	);

	oUser1.FirstName = "John";
	oUser1.LastName = "Smith";
	oUser1.Description = "Just funny person";
	println!(
		"FirstName: {} LastName: {} Description: {}",
		oUser1.FirstName,
		oUser1.LastName,
		oUser1.Description
	);

    println!("Struct_v1");
}

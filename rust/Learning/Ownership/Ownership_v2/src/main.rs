#![allow(non_snake_case)]
#![allow(non_camel_case_types)]


#[derive(Debug)]
struct A_USER {

	ID: String,
	FirstName: String,
	LastName: String,
	Email: String
}

impl Default for A_USER {

	fn default() -> A_USER {

		A_USER {
			ID: String::from("NoDefinedID"),
			FirstName: String::from("NoDefinedFirstName"),
			LastName: String::from("NoDefinedLastName"),
			Email: String::from("NoDefinedEmail")
		}
	}
}

fn fSetEmail(inUser: &mut A_USER,inEmail: String) {

	inUser.Email = inEmail;
}

fn main() {

	let mut oUser:A_USER = A_USER::default();
	println!("oUser: {:?}",oUser);

	fSetEmail(&mut oUser, String::from("email@domain.com"));
	println!("oUser: {:?}",oUser);

    println!("Ownership_v2");
}

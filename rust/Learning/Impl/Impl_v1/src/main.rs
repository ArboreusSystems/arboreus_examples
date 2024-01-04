#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

struct A_User {

	FirstName: &'static str,
	LastName: &'static str,
	Description: &'static str,
}

impl A_User {

	fn mShowDetails(inUser: &A_User) {

		println!(
			"FirstName: {:?} LastName: {:?} Description: {:?}",
			inUser.FirstName,inUser.LastName,inUser.Description
		);
	}

	fn mShowSelfDetails(&self) {

		println!(
			"FirstName: {:?} LastName: {:?} Description: {:?}",
			self.FirstName,self.LastName,self.Description
		);
	}

	fn mCreateDefault() -> Self {

		return A_User {
			FirstName: "DefaultFirstName",
			LastName: "DefaultLastName",
			Description: "DefaultDescription"
		}
	}

	fn mCreateWithData(
		inFirstName: &'static str,
		inLastName: &'static str,
		inDescription: &'static str
	) -> Self {

		return A_User {
			FirstName: inFirstName,
			LastName: inLastName,
			Description: inDescription
		}
	}
}

fn main() {

	let oUser1: A_User = A_User {
		FirstName: "John",
		LastName: "Smith",
		Description: "Somebody"
	};
	A_User::mShowDetails(&oUser1);

	let oUser2: A_User = A_User {
		FirstName: "Jack",
		LastName: "Richer",
		Description: "Nobody"
	};
	oUser2.mShowSelfDetails();

	let mut oUser3: A_User = A_User::mCreateDefault();
	A_User::mShowDetails(&oUser3);
	oUser3.FirstName = "Anna";
	oUser3.LastName = "Nikolas";
	oUser3.Description = "Super body";
	oUser3.mShowSelfDetails();

	let oUser4: A_User = A_User::mCreateWithData("AAA","BBB","CCC");
	A_User::mShowDetails(&oUser4);

	println!("Impl_v1");
}

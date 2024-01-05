#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

#[derive(Debug)]
struct A_User {

	ID: i32,
	FirstName: String,
	LastName: String,
	Location: String
}

impl A_User {

	fn mNew(
		inID: i32,
		inFirstName: String,
		inLastName: String,
		inLocation: String
	) -> Self {

		Self {
			ID: inID,
			FirstName: inFirstName,
			LastName: inLastName,
			Location: inLocation
		}
	}

	fn mSetID(mut self,inID:i32) -> Self {

		self.ID = inID;
		return self;
	}

	fn mSetFirstName(mut self,inFirstName:String) -> Self {

		self.FirstName = inFirstName;
		return self;
	}

	fn mSetLastName(mut self,inLastName:String) -> Self {

		self.LastName = inLastName;
		return self;
	}

	fn mSetLocation(mut self,inLocation:String) -> Self {

		self.Location = inLocation;
		return self;
	}
}

impl Default for A_User {

	fn default() -> Self {

		Self {
			ID: 0,
			FirstName: "NoDefinedFirstName".to_string(),
			LastName: "NoDefinedLastName".to_string(),
			Location: "NoDefinedLocation".to_string(),
		}
	}
}

fn main() {

	let oUser1: A_User = A_User::default().
		mSetID(11).
		mSetFirstName("John".to_string()).
		mSetLastName("Smith".to_string()).
		mSetLocation("Somewhere".to_string());
	println!("User1: {:?}",oUser1);

	let oUser2: A_User = A_User::mNew(
		12,"Jack".to_string(),"Reacher".to_string(),"Nowhere".to_string()
	);
	println!("User2: {:?}",oUser2);

	let mut oUser3 = oUser2.
		mSetID(12).
		mSetFirstName("AAA".to_string()).
		mSetLastName("BBB".to_string());
	println!("User3: {:?}",oUser3);
	oUser3 = oUser3.
		mSetID(12).
		mSetFirstName("CCC".to_string()).
		mSetLastName("DDD".to_string());
	println!("User3: {:?}",oUser3);

    println!("Builder_v1");
}

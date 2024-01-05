#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

#[derive(Debug)]
enum A_RequestStatus {
	Initiated, Ready, InProgress, Finished
}

#[derive(Debug)]
struct A_Request {

	Status: A_RequestStatus,
	URL: String,
	Port: u32,
	User: String,
	Password: String
}

impl Default for A_Request {

	fn default() -> Self {

		Self {
			Status: A_RequestStatus::Initiated,
			URL: "NoDefinedURL".to_string(),
			Port: 0,
			User: "NoDefinedUser".to_string(),
			Password: "NoDefinedPassword".to_string()
		}
	}
}

impl A_Request {

	fn mSetStatus(mut self,inStatus: A_RequestStatus) -> Self {

		self.Status = inStatus;
		return self;
	}

	fn mSetURL(mut self,inURL:String) -> Self {

		self.URL = inURL;
		return self;
	}

	fn mSetPort(mut self,inPort:u32) -> Self {

		self.Port = inPort;
		return self;
	}

	fn mSetUser(mut self,inUser:String) -> Self {

		self.User = inUser;
		return self;
	}

	fn mSetPassword(mut self,inPassword:String) -> Self {

		self.Password = inPassword;
		return self;
	}

	fn mCheckUrl(&self) -> bool {

		println!("Checking URL: {:?}",self.URL);
		return true;
	}

	fn mCheckUser(&self) -> bool {

		println!("Checking User: {:?}",self.User);
		return true;
	}

	fn mProceed(mut self) -> Result<Self,&'static str> {

		if
			self.Port >= 1 &&
			self.Port <= 65535 &&
			self.mCheckUrl() &&
			self.mCheckUser()
		{
			self.Status = A_RequestStatus::Ready;
			Ok(self)
		} else {
			Err("Wrong request")
		}
	}
}

fn main() {

	let oRequest1: A_Request = A_Request::default().
		mSetURL("https://some.domain/some.file".to_string()).
		mSetPort(10).
		mSetUser("USER".to_string()).
		mSetPassword("SoMePaS$Wordzzz".to_string());

	match oRequest1.mProceed() {
		Ok(matchRequest) => println!("Ok: {:?}",matchRequest),
		Err(matchError) => println!("Error: {:?}",matchError)
	}

    println!("Builder_v2");
}

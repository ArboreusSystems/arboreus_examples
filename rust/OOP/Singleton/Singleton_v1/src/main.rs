#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

static mut _A_SINGLETON: Vec<usize> = vec![];

fn main() {

	unsafe {

		_A_SINGLETON.push(10);
		println!("Singleton is {:?}",_A_SINGLETON);

		_A_SINGLETON.push(11);
		println!("Singleton is {:?}",_A_SINGLETON);
	}

    println!("Singleton_v1");
}

#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

use std::sync::Mutex;
use std::sync::MutexGuard;

static _A_SINGLETON: Mutex<Vec<usize>> = Mutex::new(vec![]);

fn main() {

	let mut oSingleton1: MutexGuard<'_, Vec<usize>> = _A_SINGLETON.lock().unwrap();
	oSingleton1.push(10);
	println!("Singleton is {:?}",oSingleton1);
	drop(oSingleton1);

	let mut oSingleton2: MutexGuard<'_, Vec<usize>> = _A_SINGLETON.lock().unwrap();
	oSingleton2.push(11);
	println!("Singleton is {:?}",oSingleton2);
	drop(oSingleton2);

    println!("Singleton_v2");
}

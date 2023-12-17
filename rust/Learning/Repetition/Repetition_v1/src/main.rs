#![allow(non_snake_case)]

use rand::Rng;

fn main() {

	let mut iNumber;

	iNumber = 5;
	loop {
		println!("{:?}",iNumber);
		iNumber -= 1;
		if iNumber == 0 {
			break;
		}
	}

	while iNumber != 10 {
		iNumber = rand::thread_rng().gen_range(1..11);
		println!("{iNumber}");
	}

    println!("Repetition v1");
}

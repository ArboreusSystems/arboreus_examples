#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

#[derive(Clone, Copy)]
enum A_GOODS_CLONE_COPY {
	APPLE, BREAD, ORANGE, BEEF, PORK, JUICE
}

enum A_GOODS_REFERENCED {
	APPLE, BREAD, ORANGE, BEEF, PORK, JUICE
}

fn fDisplayGoodsCloneCopy(inGoods: A_GOODS_CLONE_COPY) {

	match inGoods {
		A_GOODS_CLONE_COPY::BREAD => println!("A_GOODS_CLONE_COPY::BREAD"),
		A_GOODS_CLONE_COPY::BEEF => println!("A_GOODS_CLONE_COPY::BEEF"),
		A_GOODS_CLONE_COPY::APPLE => println!("A_GOODS_CLONE_COPY::APPLE"),
		A_GOODS_CLONE_COPY::JUICE => println!("A_GOODS_CLONE_COPY::JUICE"),
		A_GOODS_CLONE_COPY::ORANGE => println!("A_GOODS_CLONE_COPY::ORANGE"),
		A_GOODS_CLONE_COPY::PORK => println!("A_GOODS_CLONE_COPY::PORK")
	}
}

fn fDisplayGoodsReferenced(inGoods: &A_GOODS_REFERENCED) {

	match inGoods {
		A_GOODS_REFERENCED::BREAD => println!("A_GOODS_REFERENCED::BREAD"),
		A_GOODS_REFERENCED::BEEF => println!("A_GOODS_REFERENCED::BEEF"),
		A_GOODS_REFERENCED::APPLE => println!("A_GOODS_REFERENCED::APPLE"),
		A_GOODS_REFERENCED::JUICE => println!("A_GOODS_REFERENCED::JUICE"),
		A_GOODS_REFERENCED::ORANGE => println!("A_GOODS_REFERENCED::ORANGE"),
		A_GOODS_REFERENCED::PORK => println!("A_GOODS_REFERENCED::PORK")
	}
}

fn main() {

	let oGoodsCloneCopy: A_GOODS_CLONE_COPY = A_GOODS_CLONE_COPY::BEEF;
	fDisplayGoodsCloneCopy(oGoodsCloneCopy);
	fDisplayGoodsCloneCopy(oGoodsCloneCopy);

	let oGoodsReferenced: A_GOODS_REFERENCED = A_GOODS_REFERENCED::PORK;
	fDisplayGoodsReferenced(&oGoodsReferenced);
	fDisplayGoodsReferenced(&oGoodsReferenced);

    println!("Ownership_v1");
}

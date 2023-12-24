#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

#[derive(Clone, Copy)]
enum A_GOODS_CLONE_COPY {
	APPLE, BREAD, ORANGE, BEEF, PORK, JUICE
}

enum A_GOODS_BORROWED {
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

fn fDisplayGoodsReferenced(inGoods: &A_GOODS_BORROWED) {

	match inGoods {
		A_GOODS_BORROWED::BREAD => println!("A_GOODS_BORROWED::BREAD"),
		A_GOODS_BORROWED::BEEF => println!("A_GOODS_BORROWED::BEEF"),
		A_GOODS_BORROWED::APPLE => println!("A_GOODS_BORROWED::APPLE"),
		A_GOODS_BORROWED::JUICE => println!("A_GOODS_BORROWED::JUICE"),
		A_GOODS_BORROWED::ORANGE => println!("A_GOODS_BORROWED::ORANGE"),
		A_GOODS_BORROWED::PORK => println!("A_GOODS_BORROWED::PORK")
	}
}

fn main() {

	let oGoodsCloneCopy: A_GOODS_CLONE_COPY = A_GOODS_CLONE_COPY::BEEF;
	fDisplayGoodsCloneCopy(oGoodsCloneCopy);
	fDisplayGoodsCloneCopy(oGoodsCloneCopy);

	let oGoodsBorrowed: A_GOODS_BORROWED = A_GOODS_BORROWED::PORK;
	fDisplayGoodsReferenced(&oGoodsBorrowed);
	fDisplayGoodsReferenced(&oGoodsBorrowed);

    println!("Ownership_v1");
}

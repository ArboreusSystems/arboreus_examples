#![allow(non_snake_case)]
fn fPrintTypeOf<Type>(inName: &str, _: &Type) {

	println!("{inName}: {}",std::any::type_name::<Type>());
}

fn main() {

	let oVar1_0 = 1; fPrintTypeOf("oVar1_0",&oVar1_0);
	let oVar1_1 = 100; fPrintTypeOf("oVar1_1",&oVar1_1);
	let oVar1_2 = 100000; fPrintTypeOf("oVar1_2",&oVar1_2);
	let oVar1_3 = 100000000; fPrintTypeOf("oVar1_3",&oVar1_3);

	// Limit of auto detected integer of i32
	// let oVar1_4 = 100000000000; fPrintTypeOf("oVar1_4",&oVar1_4);
	let oVar1_5: i64 = 100000000000000; fPrintTypeOf("oVar1_5",&oVar1_5);

	let oVar2_1 = 0.300000000000000000000; fPrintTypeOf("oVar2_1",&oVar2_1);
	let oVar2_2 = 0.333333333333333333333; fPrintTypeOf("oVar2_2",&oVar2_2);
	let oVar2_3 = 0.3; fPrintTypeOf("oVar2_3",&oVar2_3);

	let oVar3_0 = "test"; fPrintTypeOf("oVar3_0",&oVar3_0);
	let oVar3_1: String = String::from(oVar3_0); fPrintTypeOf("oVar3_1",&oVar3_1);
	let oVar3_2: &str = oVar3_0; fPrintTypeOf("oVar3_2",&oVar3_2);

    println!("DataTypes v2");
}

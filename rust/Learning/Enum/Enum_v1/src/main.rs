#![allow(non_snake_case)]
#![allow(non_camel_case_types)]

mod a_enum_direction;
mod a_enum_temperature;

use crate::a_enum_direction::A_ENUM_Direction;
use crate::a_enum_temperature::A_ENUM_Temperature;

fn fPrintEnum<Type: std::fmt::Debug + std::fmt::Display>(inName: &str,inEnum:Type) {

	println!("{:?}: {:?}",inName,inEnum);
}

fn main() {

	fPrintEnum("Right",A_ENUM_Direction::Right);
	fPrintEnum("Left",A_ENUM_Direction::Left);
	fPrintEnum("Forward",A_ENUM_Direction::Forward);
	fPrintEnum("Backward",A_ENUM_Direction::Backward);
	fPrintEnum("Up",A_ENUM_Direction::Up);
	fPrintEnum("Down",A_ENUM_Direction::Down);

	fPrintEnum("Temperature_00",A_ENUM_Temperature::_00);
	fPrintEnum("Temperature_10",A_ENUM_Temperature::_10);
	fPrintEnum("Temperature_20",A_ENUM_Temperature::_20);
	fPrintEnum("Temperature_30",A_ENUM_Temperature::_30);
	fPrintEnum("Temperature_40",A_ENUM_Temperature::_40);
	fPrintEnum("Temperature_50",A_ENUM_Temperature::_50);
	fPrintEnum("Temperature_60",A_ENUM_Temperature::_60);
	fPrintEnum("Temperature_70",A_ENUM_Temperature::_70);
	fPrintEnum("Temperature_80",A_ENUM_Temperature::_80);
	fPrintEnum("Temperature_90",A_ENUM_Temperature::_90);

    println!("Enum_v1");
}

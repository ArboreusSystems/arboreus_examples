use std::fmt;

pub enum A_ENUM_Temperature {
	_00 = 0, _10 = 10,
	_20 = 20, _30 = 30,
	_40 = 40, _50 = 50,
	_60 = 60, _70 = 70,
	_80 = 80, _90 = 90
}

impl fmt::Debug for A_ENUM_Temperature {
	fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
		match *self {
			A_ENUM_Temperature::_00 => write!(f, "00"), A_ENUM_Temperature::_10 => write!(f, "10"),
			A_ENUM_Temperature::_20 => write!(f, "20"), A_ENUM_Temperature::_30 => write!(f, "30"),
			A_ENUM_Temperature::_40 => write!(f, "40"), A_ENUM_Temperature::_50 => write!(f, "50"),
			A_ENUM_Temperature::_60 => write!(f, "60"), A_ENUM_Temperature::_70 => write!(f, "70"),
			A_ENUM_Temperature::_80 => write!(f, "40"), A_ENUM_Temperature::_90 => write!(f, "90")
		}
	}
}

impl fmt::Display for A_ENUM_Temperature {
	fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
		write!(f, "{}", self)
	}
}
use std::fmt;

pub enum A_ENUM_Direction {
	Right, Left,
	Forward, Backward,
	Up, Down
}

impl fmt::Debug for A_ENUM_Direction {
	fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
		match *self {
			A_ENUM_Direction::Right => write!(f, "Right"),
			A_ENUM_Direction::Left => write!(f, "Left"),
			A_ENUM_Direction::Forward => write!(f, "Forward"),
			A_ENUM_Direction::Backward => write!(f, "Backward"),
			A_ENUM_Direction::Up => write!(f, "Up"),
			A_ENUM_Direction::Down => write!(f, "Down")
		}
	}
}

impl fmt::Display for A_ENUM_Direction {
	fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
		write!(f, "{}", self)
	}
}
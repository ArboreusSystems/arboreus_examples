#ifndef ATESTENUM_H
#define ATESTENUM_H


enum AEnum: int {

	value1 = 1,
	value2 = 2,
	value3 = 3
};

#define A_ENUM(Value) static_cast<int>(AEnum::Value)


#endif // ATESTENUM_H

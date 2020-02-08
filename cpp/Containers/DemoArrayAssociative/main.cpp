#include <iostream>

#include "aglobal.h"
#include "aarrayassociative.h"

using namespace std;


int main() {

	ALOG << "Associative Array demo" << endl;

	AArrayAssociative<string,long> oArray;

	ALOG << "Array size: " << oArray.mSize() << endl;

	oArray.mAdd("one",1);
	ALOG << "Array size: " << oArray.mSize() << endl;

	oArray.mAdd("two",2);
	ALOG << "Array size: " << oArray.mSize() << endl;

	oArray["three"] = 3;

	ALOG << "Is key: one -> " << oArray.mIsKey("one") << endl;
	ALOG << "Is key: two -> " << oArray.mIsKey("two") << endl;
	ALOG << "Is key: three -> " << oArray.mIsKey("three") << endl;

	ALOG << "Is key: one -> " << oArray["one"] << endl;
	ALOG << "Is key: two -> " << oArray["two"] << endl;
	ALOG << "Is key: three -> " << oArray["three"] << endl;

	ALOG << "Array size: " << oArray.mSize() << endl;

	return 0;
}

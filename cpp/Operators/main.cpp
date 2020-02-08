#include <iostream>

#include "aglobal.h"
#include "aoperatorindex.hpp"

using namespace std;


int main() {

	ALOG << "C++ Operators demo" << endl;

	AOperatorIndex oIndex;
	ALOG << oIndex[2] << endl;
	oIndex[2] = "xxx";
	ALOG << oIndex[2] << endl;

	return 0;
}

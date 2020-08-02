/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 02/08/2020 at 13:41:05
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <variant>

// Application includes
#include "alogger.h"

// Namespace
using namespace std;


int main() {

	variant<string,float,int> oVariant1;

	ALOG << "Size of string: " << sizeof(string) << endl;
	ALOG << "Size of integer: " << sizeof(int) << endl;
	ALOG << "Size of float: " << sizeof(float) << endl;

	oVariant1 = "String in variant";
	ALOG << "oVariant1 string index: " << oVariant1.index() << endl;
	ALOG << "oVariant1 string size: " << sizeof(oVariant1) << endl;
	if (string* oValue1 = get_if<string>(&oVariant1)) {
		ALOG << "oVariant1 string: " << *oValue1 << endl;
	} else {
		ALOG << "Wrong type of value" << endl;
	}

	oVariant1 = 100;
	ALOG << "oVariant1 int index: " << oVariant1.index() << endl;
	ALOG << "oVariant1 int size: " << sizeof(oVariant1) << endl;
	if (int* oValue1 = get_if<int>(&oVariant1)) {
		ALOG << "oVariant1 int: " << *oValue1 << endl;
	} else {
		ALOG << "Wrong type of value" << endl;
	}

	oVariant1 = 100.0f;
	ALOG << "oVariant1 float index: " << oVariant1.index() << endl;
	ALOG << "oVariant1 float size: " << sizeof(oVariant1) << endl;
	if (float* oValue1 = get_if<float>(&oVariant1)) {
		ALOG << "oVariant1 float: " << *oValue1 << endl;
	} else {
		ALOG << "Wrong type of value" << endl;
	}

	ALOG << "Variant demo - OK!" << endl;
	return 0;
}

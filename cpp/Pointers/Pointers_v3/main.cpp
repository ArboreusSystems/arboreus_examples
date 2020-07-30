/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 21/07/2020 at 13:42:46
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <vector>

// Namespace
using namespace std;

// Application includes
#include "alogger.h"
#include "aglobal.h"

// Constants

// Functions
void fFunction(void) {

	ALOG << "mFunction" << endl;
}

void fForEach(const vector<int>& inValues, void (*inCallback)(int)) {

	for (int iValue:inValues) {
		inCallback(iValue);
	}
}

void fValueCallBack(int inValue) {

	ALOG << "Value from callback: " << inValue << endl;
}


// Application
int main(int inCounter, char *inArguments[]) {

	auto oFunction1 = fFunction;
	oFunction1();

	AGlobal oGlobal;

	typedef void (AGlobal::*oFunctionViaPointer)();
	oFunctionViaPointer oFunction2 = &AGlobal::mTestMethod;
	(oGlobal.*oFunction2)();

	typedef void (AGlobal::*oFunctionViaPointerWithParameters)(string);
	oFunctionViaPointerWithParameters oFunction3 = &AGlobal::mTestMethodWithParameter;
	(oGlobal.*oFunction3)("string from main");

	auto oFunction4 = AGlobal::mTestStaticMethod;
	oFunction4();

	void (*oFunction5)() = fFunction;
	oFunction5();

	vector<int> oVector = {1,2,3,4,5,6,7,8,9};
	fForEach(oVector,fValueCallBack);

	ALOG << "Function pointers - OK" << endl;
	return 0;
}

/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 22/07/2020 at 08:29:06
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <vector>
#include <algorithm>
#include <functional>

// Namespace
using namespace std;

// Application includes
#include "alogger.h"

// Constants

// Namespace
using namespace std;

// Functions
void fForEach1(const vector<int>& inValues, void (*inFunction)(int)) {

	for (int iValue:inValues) {
		inFunction(iValue);
	}
}

void fForEach2(const vector<int>& inValues, const function<void(int)>& inFunction) {

	for (int iValue:inValues) {
		inFunction(iValue);
	}
}


// Application
int main(int inCounter, char *inArguments[]) {

	vector<int> oValues = {0,1,2,3,4,5,6,7,8,9};

	fForEach1(oValues,[](int inValue){
		ALOG << "Value from pure lambda: " << inValue << endl;
	});

	auto oLambda1 = [](int inValue){
		ALOG << "Value from lambda by variable: " << inValue << endl;
	};
	fForEach1(oValues,oLambda1);

	int oInteger = 10;
	auto oLambda2 = [&oInteger](int inValue) {
		ALOG << "Value plus integer from lambda by variable: " << inValue + oInteger << endl;
	};
	fForEach2(oValues,oLambda2);

	function<void(int)> oLambda3 = [&oInteger](int inValue) {
		ALOG << "Doubled value plus integer from lambda by variable: " << (inValue + oInteger) * 2 << endl;
	};
	fForEach2(oValues,oLambda3);

	ALOG << "Lambda demo - OK" << endl;
	return 0;
}

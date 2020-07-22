/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 22/07/2020 at 17:57:09
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <variant>
#include <vector>

// Application includes
#include "alogger.h"

// Constants

// Namespace
using namespace std;

// Functions
vector<variant<int,float,double,string>> fDemoVectorOfVariants(void) {

	vector<variant<int,float,double,string>> oOutput;
	oOutput.push_back(0);

//	oOutput.insert(0,0);
//	oOutput.insert(1,1.0f);
//	oOutput.insert(2,"string");
//	oOutput.insert(3,3.0f);
//	oOutput.insert(4,"four");
	return oOutput;
}

// Application
int main(int inCounter, char *inArguments[]) {

	vector<variant<int,float,double,string>> oVector = fDemoVectorOfVariants();
	ALOG << oVector;
//	for_each(
//		oVector.begin(),
//		oVector.end(),
//		[](variant<int,float,double,string> inValue){
//			ALOG << "Variant value: " << get<int>() << endl;
//		}
//	);

	ALOG << "Return multiple values demo - OK" << endl;
	return 0;
}

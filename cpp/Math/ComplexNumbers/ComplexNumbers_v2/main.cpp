/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 05/11/2024 at 21:20:25
 * */// --------------------------------------------------------------

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <ComplexNumber/acomplexnumber.h>

// Namespace
using namespace std;


// Console Application
int main(int inCounter, char* inArguments[]) {

	AComplexNumber oNumber1(2,3);
	ALOG << "oNumber1:" << oNumber1 << endl;

	AComplexNumber oNumber2 = oNumber1;
	ALOG << "oNumber2:" << oNumber2 << endl;

	AComplexNumber oNumber3 = oNumber1 + oNumber2;
	ALOG << "oNumber3:" << oNumber3 << endl;

	AComplexNumber oNumber4 = oNumber1 - oNumber2;
	ALOG << "oNumber4:" << oNumber4 << endl;

	ALOG << "ComplexNumbers_v2" << endl;

	return 0;
}

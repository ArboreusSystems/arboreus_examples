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
#include <Derivative/aderivative.h>

// Namespace
using namespace std;

// Global functions

// -----------
/*!
	\fn

	Doc.
*/

double gFibonachi(double inX) {

	return pow(inX, 3) + 2.0 * pow(inX, 2) + 10.0 * inX - 20.0;
}


// -----------
/*!
	\fn

	Doc.
*/

double gDerivative(AFunction inFunction, double inX) {

	double oH = sqrt(numeric_limits<double>::epsilon());
	return (inFunction(inX + oH) - inFunction(inX - oH)) / (2.0 * oH);
}


// Console Application
int main(int inCounter, char* inArguments[]) {

	AFunction oFunction{gFibonachi};
	AFunctionDerivative oFunctionDerivative{gDerivative};

	ADerivative* oDerivative = new ADerivative();
	double oValue = oDerivative->mNewtonsMethod(oFunction,oFunctionDerivative,1.0,10e-4);

	ALOG << "oValue = " << oValue << endl;

	ALOG << "Derivative_v1" << endl;
	return 0;
}

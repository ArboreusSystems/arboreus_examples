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
#include "Integral/aintegral.h"

// Namespace
using namespace std;


// Console Application
int main(int inCounter, char* inArguments[]) {

	AIntegral* oIntegralObject = new AIntegral();
	double oIntegral = oIntegralObject->mCalculate(3,15,3000);
	ALOG << "Integral: " << oIntegral << endl;

	ALOG << "Integral v1" << endl;

	return 0;
}

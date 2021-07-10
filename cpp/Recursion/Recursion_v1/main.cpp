/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 10/07/2021 at 10:38:48
 * */// --------------------------------------------------------------

// System includes
#include <iostream>

// Application includes
#include <aglobal.h>
#include <afunctions.h>

// Namespace
using namespace std;

// Constants


int main(int inCounter, char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	cout << "Recursion v1" << endl;

	int oFirst = -10;
	int oSecond = 25;

	int oSum1 = 0;
	for (int i = oFirst; i <= oSecond; i++) {
		oSum1+= i;
	}

	int oSum2 = 0;
	oSum2 = fSum(oFirst,oSecond);

	cout << "Sum1: " << oSum1 << endl;
	cout << "Sum2: " << oSum2 << endl;

	return 0;
}

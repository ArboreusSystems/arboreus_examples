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
#include "Logger/alogger.h"

// Namespace
using namespace std;
using namespace Eigen;


// Console Application
int main(int inCounter, char* inArguments[]) {

	ArrayXXf oArray01(3,3);
	ALOG << "oArray01\n" << oArray01 << endl;

	oArray01(0,0) = 1.0; oArray01(0,1) = 2.0; oArray01(0,2) = 3.0;
	oArray01(1,0) = 4.0; oArray01(1,1) = 5.0; oArray01(1,2) = 6.0;
	oArray01(2,0) = 7.0; oArray01(2,1) = 8.0; oArray01(2,2) = 9.0;
	ALOG << "oArray01\n" << oArray01 << endl;

	ArrayXXf oArray02(3,3);
	ALOG << "oArray02\n" << oArray01 << endl;

	oArray02(0,0) = 1.0; oArray02(0,1) = 2.0; oArray02(0,2) = 3.0;
	oArray02(1,0) = 1.0; oArray02(1,1) = 2.0; oArray02(1,2) = 3.0;
	oArray02(2,0) = 1.0; oArray02(2,1) = 2.0; oArray02(2,2) = 3.0;
	ALOG << "oArray02\n" << oArray01 << endl;

	ALOG << "oArray01 + oArray02\n" << oArray01 + oArray02 << endl;
	ALOG << "oArray01 * oArray02\n" << oArray01 * oArray02 << endl;
	ALOG << "oArray01 / oArray02\n" << oArray01 / oArray02 << endl;

	ALOG << "Array_v1" << endl;

	return 0;
}

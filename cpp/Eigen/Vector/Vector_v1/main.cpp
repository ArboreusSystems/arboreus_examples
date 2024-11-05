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


	Vector3d oVector_01(1,2,3);
	ALOG << "oVector_01(1,2,3);\n" << oVector_01 << endl;

	Vector3d oVector_02(1,0,0);
	ALOG << "oVector_02(1,0,0);\n" << oVector_02 << endl;

	ALOG << "-oVector_01 + oVector_02 - oVector_01\n" << -oVector_01 + oVector_02 - oVector_01 << endl;

	ALOG << "EigenVector_v1" << endl;

	return 0;
}

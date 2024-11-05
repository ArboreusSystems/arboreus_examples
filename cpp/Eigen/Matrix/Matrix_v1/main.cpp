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

	MatrixXd oMatrix(2,2);
	ALOG << "oMatrix(2,2);\n" << oMatrix << endl;

	oMatrix(0,0) = 3;
	ALOG << "oMatrix(0,0) = 3;\n" << oMatrix << endl;

	oMatrix(1,0) = 2.5;
	ALOG << "oMatrix(1,0) = 2.5;\n" << oMatrix << endl;

	oMatrix(0,1) = -1;
	ALOG << "oMatrix(0,1) = -1;\n" << oMatrix << endl;

	oMatrix(1,1) = oMatrix(1,0) + oMatrix(0,1);
	ALOG << "oMatrix(1,1) = oMatrix(1,0) + oMatrix(0,1);\n" << oMatrix << endl;

	ALOG << "EigenMatrix_v1" << endl;

	return 0;
}

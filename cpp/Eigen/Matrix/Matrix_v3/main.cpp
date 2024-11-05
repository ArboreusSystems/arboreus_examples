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

	Matrix2d oMatrix_A;
	oMatrix_A << 1, 2, 3, 4;
	ALOG << "oMatrix_A\n" << oMatrix_A << endl;

	MatrixXd oMatrix_B(2,2);
	oMatrix_B << 2, 3, 1, 4;
	ALOG << "oMatrix_B\n" << oMatrix_B << endl;

	ALOG << "oMatrix_A + oMatrix_B\n" << oMatrix_A + oMatrix_B << endl;
	ALOG << "oMatrix_A - oMatrix_B\n" << oMatrix_A - oMatrix_B << endl;
	ALOG << "oMatrix_A += oMatrix_B\n" << endl;
	oMatrix_A += oMatrix_B;
	ALOG << "\n" <<oMatrix_A << endl;

	ALOG << "EigenMatrix_v3" << endl;

	return 0;
}

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

	MatrixXd oMatrix_01(4,4);
	oMatrix_01 << 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15;
	ALOG << "oMatrix_01\n" << oMatrix_01 << endl;

	ALOG << "oMatrix_01.transpose()\n" << oMatrix_01.transpose() << endl;
	ALOG << "oMatrix_01.conjugate()\n" << oMatrix_01.conjugate() << endl;
	ALOG << "oMatrix_01.adjoint()\n" << oMatrix_01.adjoint() << endl;

	MatrixXcf oMatrix_02 = MatrixXcf::Random(2,2);
	ALOG << "oMatrix\n" << oMatrix_02 << endl;

	ALOG << "oMatrix_02.transpose()\n" << oMatrix_02.transpose() << endl;
	ALOG << "oMatrix_02.conjugate()\n" << oMatrix_02.conjugate() << endl;
	ALOG << "oMatrix_02.adjoint()\n" << oMatrix_02.adjoint() << endl;

	ALOG << "EigenMatrix_v4" << endl;

	return 0;
}

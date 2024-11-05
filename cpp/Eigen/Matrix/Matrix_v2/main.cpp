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

	int oSize = 10;


	MatrixXd oMatrix01(oSize,oSize);
	ALOG << "oMatrix01(oSize,oSize);\n" << oMatrix01 << endl;

	oMatrix01.topLeftCorner(oSize/2,oSize/2) = MatrixXd::Zero(oSize/2,oSize/2);
	ALOG << "oMatrix01.topLeftCorner(oSize/2,oSize/2) = MatrixXd::Zero(oSize/2,oSize/2);\n" << oMatrix01 << endl;

	oMatrix01.topRightCorner(oSize/2,oSize/2) = MatrixXd::Random(oSize/2,oSize/2);
	ALOG << "oMatrix01.topRightCorner(oSize/2,oSize/2) = MatrixXd::Random(oSize/2,oSize/2);\n" << oMatrix01 << endl;

	oMatrix01.bottomLeftCorner(oSize/2, oSize/2) = MatrixXd::Identity(oSize/2,oSize/2);
	ALOG << "oMatrix01.bottomLeftCorner(oSize/2, oSize/2) = MatrixXd::Identity(oSize/2,oSize/2);\n" << oMatrix01 << endl;

	oMatrix01.bottomRightCorner(oSize/2, oSize/2) = MatrixXd::Constant(oSize/2,oSize/2,3.14);
	ALOG << "oMatrix01.bottomRightCorner(oSize/2, oSize/2) = MatrixXd::Constant(oSize/2,oSize/2,3.14);\n" << oMatrix01 << endl;


	MatrixXd oMatrix02(oSize,oSize);
	ALOG << "oMatrix01(oSize,oSize);\n" << oMatrix02 << endl;

	oMatrix02.topLeftCorner(oSize/2,oSize/2).setZero();
	ALOG << "oMatrix02.topLeftCorner(oSize/2,oSize/2).setZero();\n" << oMatrix02 << endl;

	oMatrix02.topRightCorner(oSize/2,oSize/2).setIdentity();
	ALOG << "oMatrix02.topRightCorner(oSize/2,oSize/2).setIdentity();\n" << oMatrix02 << endl;

	oMatrix02.bottomLeftCorner(oSize/2,oSize/2).setIdentity();
	ALOG << "oMatrix02.bottomLeftCorner(oSize/2,oSize/2).setIdentity();\n" << oMatrix02 << endl;

	oMatrix02.bottomRightCorner(oSize/2,oSize/2).setZero();
	ALOG << "oMatrix02.bottomRightCorner(oSize/2,oSize/2).setZero();\n" << oMatrix02 << endl;


	MatrixXd oMatrix3(oSize,oSize);
	ALOG << "MatrixXd oMatrix3(oSize,oSize);\n" << oMatrix3 << endl;

	oMatrix3 <<
		MatrixXd::Zero(oSize/2,oSize/2),MatrixXd::Identity(oSize/2,oSize/2),
		MatrixXd::Identity(oSize/2,oSize/2),MatrixXd::Zero(oSize/2,oSize/2);
	ALOG << "oMatrix3 <<\n" << oMatrix3 << endl;


	ALOG << "EigenMatrix_v2" << endl;

	return 0;
}

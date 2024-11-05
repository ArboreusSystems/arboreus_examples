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

	Matrix2d oMatrix;
	oMatrix << 1,2,3,4;
	ALOG << "oMatrix_01\n" << oMatrix << endl;

	Vector2d oVector1(-1,1);
	ALOG << "oVector1\n" << oVector1 << endl;
	ALOG << "oVector1.transpose()\n" << oVector1.transpose() << endl;

	Vector2d oVector2(2,0);
	ALOG << "oVector2\n" << oVector2 << endl;
	ALOG << "oVector2.transpose()\n" << oVector2.transpose() << endl;

	ALOG << "oMatrix_01 * oMatrix_01\n" << oMatrix * oMatrix << endl;
	ALOG << "oMatrix_01 * oVector1\n" << oMatrix * oVector1 << endl;
	ALOG << "oVector1.transpose() * oMatrix_01\n" << oVector1.transpose() * oMatrix << endl;
	ALOG << "oVector1.transpose() * oVector2\n" << oVector1.transpose() * oVector2 << endl;
	ALOG << "oVector1 * oVector2.transpose()\n" << oVector1 * oVector2.transpose() << endl;

	ALOG << "EigenVector_v2" << endl;

	return 0;
}

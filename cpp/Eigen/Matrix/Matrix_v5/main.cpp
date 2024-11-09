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

	MatrixXd oMatrix = MatrixXd::Random(12,12);
	ALOG << "oMatrix\n" << oMatrix << endl;

	oMatrix.transposeInPlace();
	ALOG << "oMatrix.transposeInPlace()\n" << oMatrix << endl;

	MatrixXd oCentered = oMatrix.colwise() - oMatrix.rowwise().mean();
	ALOG << "oCentered\n" << oCentered << endl;

	MatrixXd oCovariance = oCentered * oCentered.adjoint();
	ALOG << "oCovariance\n" << oCovariance << endl;

	SelfAdjointEigenSolver<MatrixXd> oEigenSolver(oCovariance,false);
	auto oValues = oEigenSolver.eigenvalues().rightCols(1).array();
	ALOG << "oValues\n" << oValues << endl;
	ALOG << "oValues / oValues.sum()\n" << oValues / oValues.sum() << endl;

	ALOG << "EigenMatrix_v5" << endl;

	return 0;
}

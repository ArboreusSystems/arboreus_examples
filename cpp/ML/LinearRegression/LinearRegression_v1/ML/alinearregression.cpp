// ----------------------------------------------------------
/*!
	\class AObjectOne
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/11/2024 at 08:24:13
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alinearregression.h"


// -----------
/*!
	\fn

	Doc.
*/

ALinearRegression::ALinearRegression(void) {

	ALOG << "ALinearRegression created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

ALinearRegression::~ALinearRegression(void) {

	ALOG << "ALinearRegression deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

tuple<VectorXd, vector<float> > ALinearRegression::mGradientDescent(
	MatrixXd inX, MatrixXd inY, VectorXd inTheta, float inAlpha, int inIterations
) {

	MatrixXd oTemp = inTheta;

	int oParameters = inTheta.rows();

	vector<float> oCost;
	oCost.push_back(mOLSCost(inX,inY,inTheta));

	for (int i = 0; i < inIterations; i++) {
		MatrixXd iError = inX * inTheta - inY;
		for (int j = 0; j < oParameters; j++) {
			MatrixXd iX = inX.col(j);
			MatrixXd iTerm = iError.cwiseProduct(iX);
			oTemp(j,0) = inTheta(j,0) - ((inAlpha / inX.rows()) * iTerm.sum());
		}
		inTheta = oTemp;
		oCost.push_back(mOLSCost(inX,inY,inTheta));
	}

	return make_tuple(inTheta,oCost);
}


// -----------
/*!
	\fn

	Doc.
*/

float ALinearRegression::mOLSCost(MatrixXd inX, MatrixXd inY, MatrixXd inTheta) {

	MatrixXd oMatrix = pow(((inX * inTheta) - inY).array(),2);
	return (oMatrix.sum() / (2 * inX.rows()));
}

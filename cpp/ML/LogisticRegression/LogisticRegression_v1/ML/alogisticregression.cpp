// ----------------------------------------------------------
/*!
	\class ALinearRegression
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
#include "alogisticregression.h"



// -----------
/*!
	\fn

	Doc.
*/

ALogisticRegression::ALogisticRegression(void) {

	ALOG << "ALogisticRegression created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

ALogisticRegression::~ALogisticRegression(void) {

	ALOG << "ALogisticRegression deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

MatrixXd ALogisticRegression::mSigmoid(MatrixXd inMatrix) {

	return 1 / (1 + (-inMatrix.array()).exp());
}


// -----------
/*!
	\fn

	Doc.
*/

tuple<MatrixXd,double,double> ALogisticRegression::mPropagate(
	MatrixXd inWeight,double inBias,MatrixXd inX,MatrixXd inY,double inLambda
) {

	int oYRows = inY.rows();

	MatrixXd oZ = (inWeight.transpose() * inX.transpose()).array() + inBias;
	MatrixXd oSigmoid = mSigmoid(oZ);

	auto oCrossEntropy =
		-(
			inY.transpose() * (VectorXd)oSigmoid.array().log().transpose() +
			((VectorXd)(1 - inY.array())).transpose() * (VectorXd)(1 - oSigmoid.array()).log().transpose()
		) / oYRows;

	double oL2RegCost = inWeight.array().pow(2).sum() * (inLambda / (2 * oYRows));
	double oCost = static_cast<const double>((oCrossEntropy.array()[0])) + oL2RegCost;
	MatrixXd oDW =
		(MatrixXd)(((MatrixXd)(oSigmoid - inY.transpose()) * inX) / oYRows) +
		((MatrixXd)(inLambda / oYRows * inWeight)).transpose();

	double oDB = (oSigmoid-inY.transpose()).array().sum() / oYRows;

	return make_tuple(oDW,oDB,oCost);
}


// -----------
/*!
	\fn

	Doc.
*/

tuple<MatrixXd,double,MatrixXd,double,list<double>> ALogisticRegression::mOptimize(
	MatrixXd inWeight,double inBias,MatrixXd inX,MatrixXd inY,
	int inIterations,double inRate,double inLambda,bool inCost
) {

	list<double> oCostsList;
	MatrixXd oDW;
	double oDB;
	double oCost;

	for(int i = 0; i < inIterations; i++){

		tie(oDW,oDB,oCost) = mPropagate(inWeight,inBias,inX,inY,inLambda);
		inWeight = inWeight - (inRate * oDW).transpose();
		inBias = inBias - (inRate * oDB);

		if (i % 50 == 0) {
			oCostsList.push_back(oCost);
		}

		if (inCost && i % 50 == 0) {
			ALOG << "Iterations = " << i << " Cost = " << oCost << endl;
		}
	}

	return make_tuple(inWeight,inBias,oDW,oDB,oCostsList);
}


// -----------
/*!
	\fn

	Doc.
*/

MatrixXd ALogisticRegression::mPredict(Eigen::MatrixXd inWeight, double inBias, MatrixXd inX) {

	int oXRows = inX.rows();
	MatrixXd oPrediction = VectorXd::Zero(oXRows).transpose();
	MatrixXd oZ = (inWeight.transpose() * inX.transpose()).array() + inBias;
	MatrixXd oSigmoid = mSigmoid(oZ);

	for(int i = 0; i < oSigmoid.cols(); i++) {
		if (oSigmoid(0,i) <= 0.5) {
			oPrediction(0,i) = 0;
		} else {
			oPrediction(0,i) = 1;
		}
	}

	return oPrediction.transpose();
}

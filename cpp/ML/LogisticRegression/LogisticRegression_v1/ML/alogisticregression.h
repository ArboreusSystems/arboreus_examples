// ----------------------------------------------------------
/*!
	\headerfile ALogisticRegression
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/11/2024 at 08:24:13
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGISTICREGRESSION_H
#define ALOGISTICREGRESSION_H

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include "../Logger/alogger.h"

// Constants and definitions

// Namespace
using namespace std;
using namespace Eigen;

// Class definitions
class ALogisticRegression {

	public:

		explicit ALogisticRegression(void);
		virtual ~ALogisticRegression(void);

		MatrixXd mSigmoid(MatrixXd inMatrix);
		tuple<MatrixXd,double,double> mPropagate(
			MatrixXd inWeight,double inBias,MatrixXd inX,MatrixXd inY,double inLambda
		);
		tuple<MatrixXd,double,MatrixXd,double,list<double>> mOptimize(
			MatrixXd inWeight,double inBias,MatrixXd inX,MatrixXd inY,
			int inIterations,double inRate,double inLambda,bool inCost
		);
		MatrixXd mPredict(Eigen::MatrixXd inWeight, double inBias, MatrixXd inX);
};

#endif // ALOGISTICREGRESSION_H

// ----------------------------------------------------------
/*!
	\headerfile AObjectOne
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

#ifndef ALINEARREGRESSION_H
#define ALINEARREGRESSION_H

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
class ALinearRegression {

	public:

		explicit ALinearRegression(void);
		virtual ~ALinearRegression(void);

		tuple<VectorXd,vector<float>> mGradientDescent(
			MatrixXd inX, MatrixXd inY, VectorXd inTheta, float inAlpha, int inIterations
		);

	private:

		float mOLSCost(MatrixXd inX,MatrixXd inY,MatrixXd inTheta);
};

#endif // ALINEARREGRESSION_H

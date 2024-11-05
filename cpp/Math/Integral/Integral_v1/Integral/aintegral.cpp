// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/07/2020 at 08:30:50
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aintegral.h"


// -----------
/*!
	\fn

	Doc.
*/

AIntegral::AIntegral(void) {

	ALOG << "AIntegral created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

AIntegral::~AIntegral(void) {

	ALOG << "AIntegral deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

double AIntegral::mCalculate(double inBottomBound, double inTopBound, int inN) {

	double oOutput = 0;

	double oDX = (double)(inTopBound - inBottomBound) / inN;
	for (int i = 0; i < inN; i++) {
		double iX = inBottomBound + i * oDX;
		double iFunctionValue = mFunction(iX);
		double iArea = iFunctionValue * oDX;
		oOutput += iArea;
	}

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

double AIntegral::mFunction(double inX) {

	return pow(inX,3) + pow(inX,2) + inX;
}

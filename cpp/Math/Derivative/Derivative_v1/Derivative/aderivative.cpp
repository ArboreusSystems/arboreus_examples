// ----------------------------------------------------------
/*!
	\class ADerivative
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
#include "aderivative.h"


// -----------
/*!
	\fn

	Doc.
*/

ADerivative::ADerivative(void) {

	ALOG << "ADerivative created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

ADerivative::~ADerivative(void) {

	ALOG << "ADerivative deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

double ADerivative::mNewtonsMethod(
	AFunction inFunction, AFunctionDerivative inDerivative, double inX0, double inPrecision
) {

	double oX = inX0;

	for (size_t i = 0;; i++) {
		oX = oX - (inFunction(oX) / inDerivative(inFunction,oX));
		if (abs(inFunction(oX)) < inPrecision) {
			return oX;
		}
	}
}



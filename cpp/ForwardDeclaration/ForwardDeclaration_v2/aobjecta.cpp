// ----------------------------------------------------------
/*!
	\class AObjectA
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 06:31:20
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjecta.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectA::AObjectA(void) {

	ALOG << "AObjectA created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectA::~AObjectA(void) {

	ALOG << "AObjectA deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

string AObjectA::mTestString(void) {

	return pTestString;
}

// ----------------------------------------------------------
/*!
	\class AObject2
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2020 at 14:13:10
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobject2.h"


// -----------
/*!
	\fn

	Doc.
*/

AObject2::AObject2(void) {}


// -----------
/*!
	\fn

	Doc.
*/

AObject2::~AObject2(void) {}


// -----------
/*!
	\fn

	Doc.
*/

AObjectType AObject2::mGetType(void) {

	return AObjectType::Two;
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject2::mTestMethod2(void) {

	ALOG << "AObject2::mTestMethod2 called" << endl;
}


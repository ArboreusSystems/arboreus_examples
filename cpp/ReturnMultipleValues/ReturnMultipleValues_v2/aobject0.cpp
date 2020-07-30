// ----------------------------------------------------------
/*!
	\class AObject0
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2020 at 13:58:32
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobject0.h"


// -----------
/*!
	\fn

	Doc.
*/

AObject0::AObject0(void) {}


// -----------
/*!
	\fn

	Doc.
*/

AObject0::~AObject0(void) {}


// -----------
/*!
	\fn

	Doc.
*/

AObjectType AObject0::mGetType(void) {

	return AObjectType::Zero;
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject0::mTestMethod0(void) {

	ALOG << "AObject0::mTestMethod0 called" << endl;
}

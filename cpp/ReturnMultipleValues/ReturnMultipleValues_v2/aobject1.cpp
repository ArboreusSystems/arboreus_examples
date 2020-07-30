// ----------------------------------------------------------
/*!
	\class AObject1
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2020 at 14:05:45
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobject1.h"


// -----------
/*!
	\fn

	Doc.
*/

AObject1::AObject1(void) {}


// -----------
/*!
	\fn

	Doc.
*/

AObject1::~AObject1(void) {}


// -----------
/*!
	\fn

	Doc.
*/

AObjectType AObject1::mGetType(void) {

	return AObjectType::One;
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject1::mTestMethod1(void) {

	ALOG << "AObject1::mTestMethod1 called" << endl;
}


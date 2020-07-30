// ----------------------------------------------------------
/*!
	\class AObject3
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2020 at 14:15:12
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobject3.h"


// -----------
/*!
	\fn

	Doc.
*/

AObject3::AObject3(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

AObject3::~AObject3(void) {

}




// -----------
/*!
	\fn

	Doc.
*/

AObjectType AObject3::mGetType(void) {

	return AObjectType::Three;
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject3::mTestMethod3(void) {

	ALOG << "AObject3::mTestMethod3 called" << endl;
}


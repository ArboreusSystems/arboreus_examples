// ----------------------------------------------------------
/*!
	\class AObject
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/07/2020 at 12:35:45
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobject.h"

using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

AObject::AObject(void) {

	ALOG << "AObject created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

AObject::AObject(string inName) {

	pName = inName;
	ALOG << pName << " created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

AObject::~AObject(void) {

	ALOG << pName << " deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject::mTestMethod(void) {

	ALOG << pName << " mTestMethod called" << endl;
}

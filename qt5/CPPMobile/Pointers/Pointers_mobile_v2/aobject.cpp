// ----------------------------------------------------------
/*!
	\class AObject
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/07/2020 at 12:10:59
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobject.h"


// -----------
/*!
	\fn

	Doc.
*/

AObject::AObject(QObject *parent) : QObject(parent) {

	ALOG << "AObject created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObject::~AObject(void) {

	ALOG << *pName << "deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject::mTestMethod(void) {

	ALOG << *pName << "mTestMethod called";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject::mSetName(const char *inName) {

	pName = new QString(inName);
	ALOG << "Set object name ->" << *pName;
}

// ----------------------------------------------------------
/*!
	\class AObject
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2020 at 11:10:53
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

	ALOG << pName->toUtf8().data() << "Object created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObject::AObject(const char* inName,QObject *parent) : QObject(parent) {

	pName = new QString(inName);
	ALOG << pName->toUtf8().data() << "Object created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObject::~AObject(void) {

	ALOG <<  pName->toUtf8().data() << "Object deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject::mTestMethod(void) {

	ALOG << pName->toUtf8().data() << "test method called";
}


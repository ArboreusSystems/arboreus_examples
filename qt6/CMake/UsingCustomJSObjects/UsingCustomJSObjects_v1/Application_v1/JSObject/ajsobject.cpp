// ----------------------------------------------------------
/*!
	\class AJSObject
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/08/2025 at 13:32:23
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "ajsobject.h"


// -----------
/*!
	\fn

	Doc.
*/

AJSObject::AJSObject(QObject* parent) : QObject{parent} {

	_A_DEBUG << "AJSObject created";
}


// -----------
/*!
	\fn

	Doc.
*/

AJSObject::~AJSObject(void) {

	_A_DEBUG << "AJSObject deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AJSObject::mTestString(void) {

	QString oOutput("TestString");
	return oOutput;
}


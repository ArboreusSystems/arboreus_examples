// ----------------------------------------------------------
/*!
	\class AGlobal
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/07/2020 at 12:52:06
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aglobal.h"


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::AGlobal(QObject* parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::~AGlobal(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void AGlobal::mTestMethod(void) {

	ALOG << "AGlobal::mTestMethod";
}


// -----------
/*!
	\fn

	Doc.
*/

void AGlobal::mTestStaticMethod(void) {

	ALOG << "AGlobal::mTestStaticMethod";
}


// -----------
/*!
	\fn

	Doc.
*/

void AGlobal::mTestMethodWithParameter(const char* inString) {

	ALOG << "AGlobal::mTestMethodWithParameter parameter -> " << inString;
}

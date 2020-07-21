// ----------------------------------------------------------
/*!
	\class AGlobal
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/07/2020 at 17:32:48
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

AGlobal::AGlobal(void) {

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

	ALOG << "AGlobal::mTestMethod" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

void AGlobal::mTestStaticMethod(void) {

	ALOG << "AGlobal::mTestStaticMethod" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

void AGlobal::mTestMethodWithParameter(string inString) {

	ALOG << "AGlobal::mTestMethodWithParameter parameter -> " << inString << endl;
}

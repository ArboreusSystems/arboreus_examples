// ----------------------------------------------------------
/*!
	\class Backend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 21/08/2019 at 08:33:50
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "backend.h"


// -----------
/*!
	\fn

	Doc.
*/

Backend::Backend(QObject *parent) : QObject(parent) {

	aLOG << "Backend object created";
}


// -----------
/*!
	\fn

	Doc.
*/

Backend::~Backend(void) {

	aLOG << "Backend object deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void Backend::mTestMethod(void) {

	aLOG << "Backend::mTestMethod(void)";
}


// -----------
/*!
	\fn

	Doc.
*/

uint Backend::mTestUint(void) {

	aLOG << "uint Backend::mTestUint(void)";
	return 111;
}

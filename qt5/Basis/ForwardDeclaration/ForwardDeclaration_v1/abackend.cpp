// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 08:23:09
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

ABackend::ABackend(QObject *parent) : QObject(parent) {

	pObjectA = new AObjectA(this);
	pObjectB = new AObjectB(this);

	ALOG_SYSTEM << "ABackend created";
}


// -----------
/*!
	\fn

	Doc.
*/

ABackend::~ABackend(void) {

	ALOG_SYSTEM << "ABackend deleted";
}


// -----------
/*!
	\fn

	Doc.
*/


void ABackend::mTestMethod(const char* inString) {

	ALOG_SYSTEM << "ABackend::mTestMethod string:" << inString;
}

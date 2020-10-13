// ----------------------------------------------------------
/*!
	\class AObjectA
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 08:23:45
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjecta.h"

// Forwarded classes
#include "abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectA::AObjectA(ABackend* inBackend, QObject *parent) : QObject(parent) {

	pBackend = inBackend;

	ALOG_SYSTEM << "AObjectA created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectA::~AObjectA(void) {

	ALOG_SYSTEM << "AObjectA created";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObjectA::mTestMethod(void) {

	pBackend->mTestMethod("Inside AObjectA");
}

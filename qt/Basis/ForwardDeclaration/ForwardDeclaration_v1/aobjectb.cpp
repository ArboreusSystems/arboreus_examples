// ----------------------------------------------------------
/*!
	\class AObjectB
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 08:24:08
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjectb.h"

// Forwarded classes headers
#include "abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectB::AObjectB(QObject *parent) : QObject(parent) {

	pBackend = qobject_cast<ABackend*>(parent);

	ALOG_SYSTEM << "AObjectB created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectB::~AObjectB(void) {

	ALOG_SYSTEM << "AObjectB created";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObjectB::mTestMethod(void) {

	pBackend->pObjectA->mTestMethod();
}

// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 20:19:45
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

	ALOG_SYSTEM << "ABackend created";
}


// -----------
/*!
	\fn

	Doc.
*/

ABackend::~ABackend(void) {

	pLogger->deleteLater();

	ALOG_SYSTEM << "ABackend deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mSetup(void) {

	pLogger = &ALogger::mInstance();

	ALOG_SYSTEM << "ABackend setup performed";
}

// ----------------------------------------------------------
/*!
	\class ALoggerService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 11:36:13
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aloggerservice.h"


// -----------
/*!
	\fn

	Doc.
*/

ALoggerService::ALoggerService(QObject* parent) : AThreadServiceTemplate(parent) {

	_A_DEBUG << "ALoggerService created";
}


// -----------
/*!
	\fn

	Doc.
*/

ALoggerService::~ALoggerService(void) {

	_A_DEBUG << "ALoggerService deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::slInit(void) {

	_A_DEBUG << "ALoggerService initiated";

	emit this->sgInitiated();
}


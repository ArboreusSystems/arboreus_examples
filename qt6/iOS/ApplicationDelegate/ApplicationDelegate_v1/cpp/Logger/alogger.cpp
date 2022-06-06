// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 11:15:25
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alogger.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

ALogger::ALogger(QObject* parent) : AThreadTemplate<ALoggerService>(new ALoggerService, parent) {

	this->setPriority(QThread::Priority::LowestPriority);

	QObject::connect(
		this,&ALogger::sgInit,
		this->mService(),&ALoggerService::slInit
	);
	QObject::connect(
		this->mService(),&ALoggerService::sgInitiated,
		this,&ALogger::slInitiated
	);

	_A_DEBUG << "ALogger created";
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger::~ALogger(void) {

	_A_DEBUG << "ALogger deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mInit(void) {

	pBackend = &ABackend::mInstance();

	emit this->sgInit();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::slInitiated(void) {

	_A_DEBUG << "ALogger initiated";

	emit this->sgInitiated();
}


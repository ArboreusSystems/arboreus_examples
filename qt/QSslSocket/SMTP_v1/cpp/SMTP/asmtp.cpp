// ----------------------------------------------------------
/*!
	\class ASMTP
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/01/2022 at 18:00:10
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asmtp.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

ASMTP::ASMTP(QObject* parent) : AThreadTemplate<ASMTPService>(new ASMTPService, parent) {

	QObject::connect(
		this,&ASMTP::sgInit,
		this->mService(),&ASMTPService::slInit
	);
	QObject::connect(
		this->mService(),&ASMTPService::sgInitiated,
		this,&ASMTP::slInitiated
	);

	_A_DEBUG << "ASMTP created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASMTP::~ASMTP(void) {

	_A_DEBUG << "ASMTP deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTP::mInit(void) {

	pBackend = &ABackend::mInstance();
	this->start(QThread::Priority::LowPriority);

	emit sgInit();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTP::slInitiated(void) {

	_A_DEBUG << "ASMTP initiated";

	emit sgInitiated();
}


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
	QObject::connect(
		this,&ASMTP::sgSetProperties,
		this->mService(),&ASMTPService::slSetProperties
	);
	QObject::connect(
		this->mService(),&ASMTPService::sgPropertiesUpdated,
		this,&ASMTP::slPropertiesUpdated
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
	this->setPriority(QThread::Priority::LowPriority);

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


// -----------
/*!
	\fn

	Doc.
*/

void ASMTP::slPropertiesUpdated(void) {

	emit sgPropertiesUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap ASMTP::mGetProperties(void) {

	return this->mService()->mGetProperties().mToVariantMap();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTP::mSetProperties(QVariantMap inProperties) {

	ASMTPProperties oProperties;
	oProperties.mFromVariantMap(inProperties);
	emit sgSetProperties(oProperties);
}


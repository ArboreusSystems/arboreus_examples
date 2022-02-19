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
	QObject::connect(
		this,&ASMTP::sgMessageSend,
		this->mService(),&ASMTPService::slMessageSend
	);
	QObject::connect(
		this->mService(),&ASMTPService::sgMessageSent,
		this,&ASMTP::slMessageSent
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

void ASMTP::slMessageSent(QString inMessageID) {

	ACacheReply oRemovingMessage = pBackend->pCache->mRemove(inMessageID);
	if (oRemovingMessage.Status) {
		_A_DEBUG << "Message deleted from cache:" << inMessageID;
	} else {
		_A_CRITICAL << "Message from cache not deleted properly";
	}

	emit sgMessageSent(inMessageID);
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

QVariantMap ASMTP::mTemplateMessage(void) {

	ASMTPMessage oMessage;
	return oMessage.mToVariantMap();
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


// -----------
/*!
	\fn

	Doc.
*/

void ASMTP::mMessageSend(QString inMessageID) {

	ASMTPMessage oMessage;

	ACacheReply oRawMessage = pBackend->pCache->mGet(inMessageID);
	if (oRawMessage.Status) {
		oMessage.mFromVariantMap(qvariant_cast<QVariantMap>(oRawMessage.Data));
		_A_DEBUG << "Got message to send.";
		_A_DEBUG << "ID:" << oMessage.ID;
		_A_DEBUG << "To:" << oMessage.To;
		_A_DEBUG << "From:" << oMessage.From;
		_A_DEBUG << "Subject:" << oMessage.Subject;
		_A_DEBUG << "Message:" << oMessage.Message;
	} else {
		_A_CRITICAL << "No message by ID";
	}

	emit sgMessageSend(oMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

QString ASMTP::mMessageIDGenerate(void) {

	QString oMessageID = ASequenceString::mRandom(32);
	return oMessageID;
}


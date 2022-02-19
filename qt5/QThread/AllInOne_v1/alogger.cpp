// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 07:37:35
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alogger.h"


// -----------
/*!
	\fn

	Doc.
*/

ALogger::ALogger(QObject *parent) : QObject(parent) {

	pThread = new AThread(this);

	pService = new ALoggerService();
	pService->moveToThread(pThread);

	QObject::connect(
		this,&ALogger::sgLogEvent,
		pService,&ALoggerService::slLogEvent
	);
	QObject::connect(
		pThread,&AThread::finished,
		pService,&ALoggerService::deleteLater
	);

	pThread->start();

	ALOG << "ALogger created";
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger::~ALogger(void) {

	pThread->mQuit();

	ALOG << "ALogger deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteEvent(const QString& inEvent) {

	emit sgLogEvent(inEvent);
}

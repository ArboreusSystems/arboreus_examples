// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/12/2020 at 20:06:59
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alogger.h"

// Forwarded classes
#include "abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

ALogger::ALogger(QObject *parent) : AObjectTemplate(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

ALogger::~ALogger(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mInitWithThread(AThreadTemplate *inThread) {

	pThread = inThread;
	pService = new ALoggerService();
	pService->moveToThread(pThread);

	QObject::connect(
		this,&ALogger::sgWriteToLog,
		pService,&ALoggerService::mWriteToLog
	);

	QObject::connect(
		pService,&ALoggerService::sgLogUpdated,
		this,&ALogger::mLogUpdated
	);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToLog(const QString &inEvent) {

	ALOG_SYSTEM << "ALogger::mWriteToLog" << QThread::currentThreadId();
	emit sgWriteToLog(inEvent);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mLogUpdated(void) {

	ALOG_SYSTEM << "ALogger::mWriteToLog" << QThread::currentThreadId();
	emit sgLogUpdated();
}

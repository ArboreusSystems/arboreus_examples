// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2021 at 18:16:22
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

	A_CONSOLE_DEBUG("ALogger created");
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger::~ALogger(void) {

	A_CONSOLE_DEBUG("ALogger deleted");
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger& ALogger::mInstance(AProperties* inProperties) {

	static ALogger oInstance;
	if (inProperties) {
		oInstance.mSetup();
	}
	return oInstance;
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mSetup(void) {

	A_CONSOLE_DEBUG("ALogger initialised");
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mInitWithThread(AThreadTemplate *inThread) {

	pThread = inThread;
	pService = new ALoggerService(this);
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

void ALogger::mWriteToLog(
	QtMsgType inType,
	const QMessageLogContext& inContext,
	const QString& inMessage
) {

	ALoggerMessageModel* oMessage = new ALoggerMessageModel();
	oMessage->Time = QDateTime::currentMSecsSinceEpoch();
	oMessage->Type = inType;
	oMessage->Context = &inContext;
	oMessage->Message = &inMessage;

	ALogger* oLogger = &ALogger::mInstance();
	oLogger->mEmitSgWriteToLog(oMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mEmitSgWriteToLog(ALoggerMessageModel *inMessage) {

	emit sgWriteToLog(inMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mLogUpdated(void) {

	emit sgLogUpdated();
}

// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/10/2020 at 15:03:15
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

void ALogger::mWriteToLog(
	QtMsgType inType,
	const QMessageLogContext& inContext,
	const QString& inMessage
) {

	QByteArray oLocalMessage;
	QString oLogType = inMessage.left(5);
	if (oLogType != QString("[USR]")) {
		oLogType = QString("[SYS]");
		oLocalMessage = inMessage.toLocal8Bit();
	} else {
		oLocalMessage = inMessage.right(inMessage.length() - 6).toLocal8Bit();
	}

	ALoggerModelMessage* oMessage = new ALoggerModelMessage();
	oMessage->pMsgType = inType;
	oMessage->pTime = QDateTime::currentMSecsSinceEpoch();
	oMessage->pActorType = oLogType;
	oMessage->pMessage = QString::fromStdString(oLocalMessage.toStdString());
	oMessage->pFile = inContext.file ? QString(inContext.file) : QString("no file");
	oMessage->pLine = inContext.line;
	oMessage->pFuntcion = inContext.function ? QString(inContext.function) : QString("no function");

	ALogger* oLogger = (&ABackend::mInstance())->pLogger;
	oLogger->mEmitSgWriteToLog(oMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mEmitSgWriteToLog(ALoggerModelMessage* inMessage) {

	emit sgWriteToLog(inMessage);
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

void ALogger::mLogUpdated(void) {

	emit sgLogUpdated();
}


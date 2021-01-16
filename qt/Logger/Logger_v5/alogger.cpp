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

	ALogger* oLogger = (&ABackend::mInstance())->pLogger;
	oLogger->mWriteToConsole(inType,inContext,inMessage);
	oLogger->mWriteToDB(inMessage);
	oLogger->mEmitSgWriteToLog(inType,inContext,inMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToConsole(
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
	const char* oFile = inContext.file ? inContext.file : "no file";
	const char* oFunction = inContext.function ? inContext.function : "no function";
	int64_t oTime = QDateTime::currentMSecsSinceEpoch();
	switch (inType) {
	case QtDebugMsg:
#ifdef QT_DEBUG
		fprintf(stderr, "%llu [DBG]:%s %s [%s]:[%u]:[%s]\n", oTime, oLogType.toLocal8Bit().constData(), oLocalMessage.constData(), oFile, inContext.line, oFunction);
#endif
		break;
	case QtInfoMsg:
		fprintf(stderr, "%llu [INF]:%s %s [%s]:[%u]:[%s]\n", oTime, oLogType.toLocal8Bit().constData(), oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtWarningMsg:
		fprintf(stderr, "%llu [WAR]:%s %s [%s]:[%u]:[%s]\n", oTime, oLogType.toLocal8Bit().constData(), oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtCriticalMsg:
		fprintf(stderr, "%llu [CRI]:%s %s [%s]:[%u]:[%s]\n", oTime, oLogType.toLocal8Bit().constData(), oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtFatalMsg:
		fprintf(stderr, "%llu [FAT]:%s %s [%s]:[%u]:[%s]\n", oTime, oLogType.toLocal8Bit().constData(), oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	}
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToDB(QString inMessage) {}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mEmitSgWriteToLog(
	QtMsgType inType,
	const QMessageLogContext &inContext,
	const QString &inMessage
) {

	emit sgWriteToLog(QString("TestEmitString"));
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
		pService,&ALoggerService::mTestSlot
	);

//	QObject::connect(
//		pService,&ALoggerService::sgLogUpdated,
//		this,&ALogger::mLogUpdated
//	);
}


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


// -----------
/*!
	\fn

	Doc.
*/

ALogger::ALogger(QObject *parent) : QObject(parent) {

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

	ALogger* oLogger = &ALogger::mInstance();
	oLogger->mWriteToConsole(inType,inContext,inMessage);
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

	QByteArray oLocalMessage = inMessage.toLocal8Bit();
	const char* oFile = inContext.file ? inContext.file : "no file";
	const char* oFunction = inContext.function ? inContext.function : "no function";
	int64_t oTime = QDateTime::currentMSecsSinceEpoch();
	switch (inType) {
	case QtDebugMsg:
		fprintf(stderr, "%llu [DBG] %s [%s]:[%u]:[%s]\n", oTime, oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtInfoMsg:
		fprintf(stderr, "%llu [INF] %s [%s]:[%u]:[%s]\n", oTime, oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtWarningMsg:
		fprintf(stderr, "%llu [WAR] %s [%s]:[%u]:[%s]\n", oTime, oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtCriticalMsg:
		fprintf(stderr, "%llu [CRI] %s [%s]:[%u]:[%s]\n", oTime, oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtFatalMsg:
		fprintf(stderr, "%llu [FAT] %s [%s]:[%u]:[%s]\n", oTime, oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	}
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToLog(QString inMessage) {}

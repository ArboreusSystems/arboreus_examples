// ----------------------------------------------------------
/*!
	\class ALoggerService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/01/2021 at 17:21:46
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aloggerservice.h"


// -----------
/*!
	\fn

	Doc.
*/

ALoggerService::ALoggerService(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

ALoggerService::~ALoggerService(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToLog(const QString &inMessage) {

	ALOG_SYSTEM << "ALoggerService::mWriteToLog" << QThread::currentThreadId();
	ALOG_QML << inMessage.toUtf8();
	emit sgLogUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mTestSlot(QString inType) {


	fprintf(stderr,inType.toUtf8());

//	switch (inType) {
//		case QtDebugMsg:
//#ifdef QT_DEBUG
//			fprintf(stderr, "[DBG]");
//#endif
//			break;
//		case QtInfoMsg:
//			fprintf(stderr, "[INF]");
//			break;
//		case QtWarningMsg:
//			fprintf(stderr, "[WAR]");
//			break;
//		case QtCriticalMsg:
//			fprintf(stderr, "[CRI]");
//			break;
//		case QtFatalMsg:
//			fprintf(stderr, "[FAT]");
//			break;
//		}

	emit sgLogUpdated();
}

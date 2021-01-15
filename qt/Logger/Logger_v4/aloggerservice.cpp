// ----------------------------------------------------------
/*!
	\class ALoggerService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/12/2020 at 20:09:13
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

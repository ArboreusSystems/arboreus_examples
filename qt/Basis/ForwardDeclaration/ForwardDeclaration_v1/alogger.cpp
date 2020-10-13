// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 08:17:13
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

	ALOG_SYSTEM << "ALogger created";
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger::~ALogger(void) {

	ALOG_SYSTEM << "ALogger deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToLog(QString inMessage) {

	ALOG_QML << inMessage.toUtf8().data();
}

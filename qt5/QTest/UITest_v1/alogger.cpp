// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/09/2020 at 19:36:34
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

void ALogger::mWriteToLog(QString inMessage) {

	ALOG_QML << inMessage.toUtf8();
}


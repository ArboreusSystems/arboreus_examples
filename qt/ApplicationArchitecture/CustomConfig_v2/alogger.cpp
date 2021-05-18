// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 05/04/2021 at 20:18:09
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alogger.h"

// Forwarded classes
#include <abackend.h>

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

ALogger::ALogger(QObject *parent) : QObject(parent) {

	ALOG << "ALogger created";
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger::~ALogger(void) {

	ALOG << "ALogger deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mInit(void) {

	pBackend = &ABackend::mInstance();
	pConfig = qobject_cast<ALoggerConfig*>(pBackend->pConfig);

	ALOG << "ALogger initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mTest(void) {

	ALOG << "Test value from config:" << pConfig->mLoggerConfigValue();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToLog(QString inMessage) {

	ALOG_QML << inMessage.toUtf8().data();
}

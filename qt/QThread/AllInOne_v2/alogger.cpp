// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 08:44:01
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

ALogger::ALogger(QThread::Priority inPriority,QObject *parent)
	: AThread<ALoggerService>(inPriority, new ALoggerService,parent) {

	QObject::connect(
		this,&ALogger::sgLogEvent,
		this->mService(),&ALoggerService::slLogEvent
	);

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

void ALogger::mWriteToLog(const QString& inEvent) {

	emit sgLogEvent(inEvent);
}

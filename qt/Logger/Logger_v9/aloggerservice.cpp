// ----------------------------------------------------------
/*!
	\class ALoggerService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 16:12:09
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

ALoggerService::ALoggerService(QObject* parent) : AThreadServiceTemplate(parent) {

	A_CONSOLE_MESSAGE_DEBUG("ALoggerService created");
}


// -----------
/*!
	\fn

	Doc.
*/

ALoggerService::~ALoggerService(void) {

	A_CONSOLE_MESSAGE_DEBUG("ALoggerService deleted");
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::slWriteToLog(ALoggerMessageModel* inMessage) {

	this->mWriteToDB(inMessage);

#ifdef QT_DEBUG

	fLoggerWriteToConsole(
		inMessage->Time,
		inMessage->Type.toStdString().c_str(),
		inMessage->Actor.toStdString().c_str(),
		inMessage->Message.toStdString().c_str(),
		inMessage->File.toStdString().c_str(),
		inMessage->Line.toInt(),
		inMessage->Function.toStdString().c_str()
	);

#endif

	emit sgLogUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToDB(ALoggerMessageModel* inMessage) {

	Q_UNUSED(inMessage);
}

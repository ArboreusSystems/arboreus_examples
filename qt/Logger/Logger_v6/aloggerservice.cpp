// ----------------------------------------------------------
/*!
	\class ALoggerService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2021 at 21:26:31
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

	A_CONSOLE_DEBUG("ALoggerService created");
}


// -----------
/*!
	\fn

	Doc.
*/

ALoggerService::~ALoggerService(void) {

	A_CONSOLE_DEBUG("ALoggerService deleted");
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mConsoleMessageDebug(
	uint64_t inTime, const char* inType, const char* inActor,
	const char* inMessage,
	int inLine, const char* inFile, const char* inFunction
) {

#ifdef QT_DEBUG
	A_CONSOLE_OUTPUT;
#else
	Q_UNUSED(inTime)
	Q_UNUSED(inType)
	Q_UNUSED(inActor)
	Q_UNUSED(inMessage)
	Q_UNUSED(inFile)
	Q_UNUSED(inLine)
	Q_UNUSED(inFunction)
#endif
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mConsoleMessage(
	uint64_t inTime, const char* inType, const char* inActor,
	const char* inMessage,
	int inLine, const char* inFile, const char* inFunction
) {

	A_CONSOLE_OUTPUT;
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToLog(ALoggerMessageModel* inMessage) {

	const char* oType;
	switch (inMessage->Type) {
		case QtInfoMsg: oType = "DBG"; break;
		case QtWarningMsg: oType = "WAR"; break;
		case QtCriticalMsg: oType = "CRI"; break;
		case QtFatalMsg: oType = "FAT"; break;
		default: oType = "DBG";	break;
	}

	const char* oMessage;
	const char* oActor;
	if (inMessage->Message->left(5).toLocal8Bit().data() != "[USR]") {
		oActor = "SYS";
		oMessage = inMessage->Message->toLocal8Bit().data();
	} else {
		oActor = "USR";
		oMessage = inMessage->Message->right(inMessage->Message->length() - 6).toLocal8Bit().data();
	}

	this->mWriteToDB(
		inMessage->Time,oType,oActor,oMessage,
		inMessage->Context->line,inMessage->Context->file,inMessage->Context->function
	);

	this->mWriteToConsole(
		inMessage->Time,oType,oActor,oMessage,
		inMessage->Context->line,inMessage->Context->file,inMessage->Context->function
	);

	emit sgLogUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToDB(
	uint64_t inTime, const char* inType, const char* inActor,
	const char* inMessage,
	int inLine, const char* inFile, const char* inFunction
){

	Q_UNUSED(inTime);
	Q_UNUSED(inType);
	Q_UNUSED(inActor);
	Q_UNUSED(inMessage);
	Q_UNUSED(inLine);
	Q_UNUSED(inFile);
	Q_UNUSED(inFunction);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToConsole(
	uint64_t inTime, const char* inType, const char* inActor,
	const char* inMessage,
	int inLine, const char* inFile, const char* inFunction
) {

	A_CONSOLE_OUTPUT;
}

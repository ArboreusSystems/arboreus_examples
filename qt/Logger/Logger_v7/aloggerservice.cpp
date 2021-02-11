// ----------------------------------------------------------
/*!
	\class ALoggerService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2021 at 14:31:14
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

void ALoggerService::mWriteToConsoleDebug(
	uint64_t inTime, const char* inActor,const char* inMessage,
	int inLine, const char* inFile,	const char* inFunction
) {

#ifdef QT_DEBUG
	std::string oInfo = ALoggerService::mCreateLogInfo(inLine,inFile,inFunction);
	std::string oType = ALoggerService::mCreateLogType(A_LOGGER_DEFAULT_STRING_DEBUG,inActor);
	qDebug() << inTime << oType.c_str() << inMessage << oInfo.c_str();
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

void ALoggerService::mWriteToConsoleInfo(
	uint64_t inTime, const char *inActor, const char *inMessage,
	int inLine, const char *inFile, const char *inFunction
) {

	std::string oInfo = ALoggerService::mCreateLogInfo(inLine,inFile,inFunction);
	std::string oType = ALoggerService::mCreateLogType(A_LOGGER_DEFAULT_STRING_INFO,inActor);
	qInfo() << inTime << oType.c_str() << inMessage << oInfo.c_str();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToConsoleWarning(
	uint64_t inTime, const char *inActor, const char *inMessage,
	int inLine, const char *inFile, const char *inFunction
) {

	std::string oInfo = ALoggerService::mCreateLogInfo(inLine,inFile,inFunction);
	std::string oType = ALoggerService::mCreateLogType(A_LOGGER_DEFAULT_STRING_WARNING,inActor);
	qWarning() << inTime << oType.c_str() << inMessage << oInfo.c_str();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToConsoleCritical(
	uint64_t inTime, const char *inActor, const char *inMessage,
	int inLine, const char *inFile, const char *inFunction
) {

	std::string oInfo = ALoggerService::mCreateLogInfo(inLine,inFile,inFunction);
	std::string oType = ALoggerService::mCreateLogType(A_LOGGER_DEFAULT_STRING_CRITICAL,inActor);
	qCritical() << inTime << oType.c_str() << inMessage << oInfo.c_str();
}



// -----------
/*!
	\fn

	Doc.
*/

std::string ALoggerService::mCreateLogInfo(int inLine, const char *inFile, const char *inFunction) {

	std::string oInfo("[");
	oInfo.append(inFile);
	oInfo.append("]:[");
	oInfo.append(std::to_string(inLine));
	oInfo.append("]:[");
	oInfo.append(inFunction);
	oInfo.append("]");

	return oInfo;
}


// -----------
/*!
	\fn

	Doc.
*/

std::string ALoggerService::mCreateLogType(const char *inType, const char *inActor) {

	std::string oType("[");
	oType.append(inType);
	oType.append("]:[");
	oType.append(inActor);
	oType.append("]");

	return oType;
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToLogDebug(ALoggerMessageModel* inMessage) {

	this->mWriteToDB(
		inMessage->Time, A_LOGGER_DEFAULT_STRING_DEBUG,
		inMessage->Actor,inMessage->Message,
		inMessage->Line,inMessage->File,inMessage->Function
	);

	ALoggerService::mWriteToConsoleDebug(
		inMessage->Time,inMessage->Actor,inMessage->Message,
		inMessage->Line,inMessage->File,inMessage->Function
	);

	emit sgLogUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToLogInfo(ALoggerMessageModel* inMessage) {

	this->mWriteToDB(
		inMessage->Time, A_LOGGER_DEFAULT_STRING_INFO,
		inMessage->Actor,inMessage->Message,
		inMessage->Line,inMessage->File,inMessage->Function
	);

	ALoggerService::mWriteToConsoleInfo(
		inMessage->Time,inMessage->Actor,inMessage->Message,
		inMessage->Line,inMessage->File,inMessage->Function
	);

	emit sgLogUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToLogWarning(ALoggerMessageModel* inMessage) {

	this->mWriteToDB(
		inMessage->Time, A_LOGGER_DEFAULT_STRING_WARNING,
		inMessage->Actor,inMessage->Message,
		inMessage->Line,inMessage->File,inMessage->Function
	);

	ALoggerService::mWriteToConsoleWarning(
		inMessage->Time,inMessage->Actor,inMessage->Message,
		inMessage->Line,inMessage->File,inMessage->Function
	);

	emit sgLogUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToLogCritical(ALoggerMessageModel* inMessage) {

	this->mWriteToDB(
		inMessage->Time, A_LOGGER_DEFAULT_STRING_CRITICAL,
		inMessage->Actor,inMessage->Message,
		inMessage->Line,inMessage->File,inMessage->Function
	);

	ALoggerService::mWriteToConsoleCritical(
		inMessage->Time,inMessage->Actor,inMessage->Message,
		inMessage->Line,inMessage->File,inMessage->Function
	);

	emit sgLogUpdated();
}



// -----------
/*!
	\fn

	Doc.
*/


void ALoggerService::mWriteToDB(
	uint64_t inTime, const char *inType, const char *inActor,
	const char *inMessage,
	int inLine, const char *inFile, const char *inFunction
) {

	Q_UNUSED(inTime);
	Q_UNUSED(inType);
	Q_UNUSED(inActor);
	Q_UNUSED(inMessage);
	Q_UNUSED(inLine);
	Q_UNUSED(inFile);
	Q_UNUSED(inFunction);
}

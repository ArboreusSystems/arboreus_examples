// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/03/2021 at 13:38:42
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alogger.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

ALogger::ALogger(QObject *parent) : QObject(parent) {

	A_CONSOLE_MESSAGE_DEBUG("ALogger created");
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger::~ALogger(void) {

	A_CONSOLE_MESSAGE_DEBUG("ALogger deleted");
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger& ALogger::mInstance(void) {

	static ALogger oInstance;
	A_CONSOLE_MESSAGE_DEBUG("ALogger instantiated");
	return oInstance;
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mInitWithThread(AThreadTemplate* inThread) {

	pThread = inThread;
	pService = new ALoggerService();
	pService->moveToThread(pThread);

	QObject::connect(
		this,&ALogger::sgWriteToLog,
		pService,&ALoggerService::slWriteToLog
	);

	QObject::connect(
		pService,&ALoggerService::sgLogUpdated,
		this,&ALogger::slLogUpdated
	);

	A_CONSOLE_MESSAGE_DEBUG("ALogger initiated");
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToLogDebug(
	const char* inMessage, const char* inFile, int inLine, const char* inFunction
) {

	this->mWriteToLog(
		A_LOGGER_DEFAULT_STRING_DEBUG,A_LOGGER_DEFAULT_STRING_SYSTEM,
		QString(inMessage),QString(inFile),
		QString::number(inLine),QString(inFunction)
	);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToLogInfo(
	const char* inMessage, const char* inFile, int inLine, const char* inFunction
) {

	this->mWriteToLog(
		A_LOGGER_DEFAULT_STRING_INFO,A_LOGGER_DEFAULT_STRING_SYSTEM,
		QString(inMessage),QString(inFile),
		QString::number(inLine),QString(inFunction)
	);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToLogWarning(
	const char* inMessage, const char* inFile, int inLine, const char* inFunction
) {

	this->mWriteToLog(
		A_LOGGER_DEFAULT_STRING_WARNING,A_LOGGER_DEFAULT_STRING_SYSTEM,
		QString(inMessage),QString(inFile),
		QString::number(inLine),QString(inFunction)
	);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToLogCritical(
	const char* inMessage, const char* inFile, int inLine, const char* inFunction
) {

	this->mWriteToLog(
		A_LOGGER_DEFAULT_STRING_CRITICAL,A_LOGGER_DEFAULT_STRING_SYSTEM,
		QString(inMessage),QString(inFile),
		QString::number(inLine),QString(inFunction)
	);
}



// -----------
/*!
	\fn

	Doc.
*/

void ALogger::slWriteToLogDebug(QString inActor,QString inMessage,QString inInfo) {

	QStringList oParsedInfo = inInfo.split("@");
	QStringList oParseLineAndFunction = oParsedInfo[1].split(":");
	QString oLine = oParseLineAndFunction.takeLast();

	this->mWriteToLog(
		A_LOGGER_DEFAULT_STRING_DEBUG,inActor,inMessage,
		oParsedInfo[1].left(oParsedInfo[1].length() - oLine.length() - 1),
		oLine,oParsedInfo[0]
	);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::slWriteToLogInfo(QString inActor,QString inMessage,QString inInfo) {

	QStringList oParsedInfo = inInfo.split("@");
	QStringList oParseLineAndFunction = oParsedInfo[1].split(":");
	QString oLine = oParseLineAndFunction.takeLast();

	this->mWriteToLog(
		A_LOGGER_DEFAULT_STRING_INFO,inActor,inMessage,
		oParsedInfo[1].left(oParsedInfo[1].length() - oLine.length() - 1),
		oLine,oParsedInfo[0]
	);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::slWriteToLogWarning(QString inActor,QString inMessage,QString inInfo) {

	QStringList oParsedInfo = inInfo.split("@");
	QStringList oParseLineAndFunction = oParsedInfo[1].split(":");
	QString oLine = oParseLineAndFunction.takeLast();

	this->mWriteToLog(
		A_LOGGER_DEFAULT_STRING_WARNING,inActor,inMessage,
		oParsedInfo[1].left(oParsedInfo[1].length() - oLine.length() - 1),
		oLine,oParsedInfo[0]
	);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::slWriteToLogCritical(QString inActor,QString inMessage,QString inInfo) {

	QStringList oParsedInfo = inInfo.split("@");
	QStringList oParseLineAndFunction = oParsedInfo[1].split(":");
	QString oLine = oParseLineAndFunction.takeLast();

	this->mWriteToLog(
		A_LOGGER_DEFAULT_STRING_CRITICAL,inActor,inMessage,
		oParsedInfo[1].left(oParsedInfo[1].length() - oLine.length() - 1),
		oLine,oParsedInfo[0]
	);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::slLogUpdated(void) {

	emit sgLogUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWriteToLog(
	QString inType, QString inActor, QString inMessage,
	QString inFile, QString inLine, QString inFunction
) {

	ALoggerMessageModel* oMessage = new ALoggerMessageModel();
	oMessage->Type = inType;
	oMessage->Actor = inActor;
	oMessage->Message = inMessage;
	oMessage->Line = inLine;
	oMessage->File = inFile;
	oMessage->Function = inFunction;

	emit sgWriteToLog(oMessage);
}

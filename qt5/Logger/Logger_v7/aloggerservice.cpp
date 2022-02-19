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

void ALoggerService::slWriteToLog(ALoggerMessageModel* inMessage) {

	this->mWriteToDB(inMessage);
	ALoggerService::mWriteToConsole(
		inMessage->Time,
		inMessage->Type.toStdString().c_str(),
		inMessage->Actor.toStdString().c_str(),
		inMessage->Message.toStdString().c_str(),
		inMessage->File.toStdString().c_str(),
		inMessage->Line.toInt(),
		inMessage->Function.toStdString().c_str()
	);

	emit sgLogUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToConsole(
	uint64_t inTime, const char* inType, const char* inActor,
	const char* inMessage,
	const char* inFile,int inLine,const char* inFunction
) {

	std::string oType = "[" + std::string(inType) + "]:[" + std::string(inActor) +"]";
	std::string oInfo = "[" + std::string(inFile) + "]:[" + std::to_string(inLine) + "]:[" + std::string(inFunction) + "]";

	qDebug() <<	inTime << oType.c_str() << inMessage << oInfo.c_str();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToDB(ALoggerMessageModel* inMessage) {

	Q_UNUSED(inMessage);
}

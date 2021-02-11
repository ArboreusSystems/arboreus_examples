// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2021 at 14:30:47
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

	A_CONSOLE_DEBUG("ALogger created");
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger::~ALogger(void) {

	delete pService;

	A_CONSOLE_DEBUG("ALogger deleted");
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger& ALogger::mInstance(void) {

	static ALogger oInstance;
	return oInstance;
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mInitWithThread(AThreadTemplate *inThread) {

	pThread = inThread;
	pService = new ALoggerService();
	pService->moveToThread(pThread);

	QObject::connect(
		this,&ALogger::sgWriteToLogDebug,
		pService,&ALoggerService::mWriteToLogDebug
	);
	QObject::connect(
		this,&ALogger::sgWriteToLogInfo,
		pService,&ALoggerService::mWriteToLogInfo
	);
	QObject::connect(
		this,&ALogger::sgWriteToLogWarning,
		pService,&ALoggerService::mWriteToLogWarning
	);
	QObject::connect(
		this,&ALogger::sgWriteToLogCritical,
		pService,&ALoggerService::mWriteToLogCritical
	);

	QObject::connect(
		pService,&ALoggerService::sgLogUpdated,
		this,&ALogger::mLogUpdated
	);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mDebug(
	const char *inMessage, int inLine, const char *inFile, const char *inFunction
) {

#ifdef QT_DEBUG
	A_LOGGER_CREATE_MESSAGE_FROM_CPP;
	emit sgWriteToLogDebug(oMessage);
#else
	Q_UNUSED(inMessage)
	Q_UNUSED(inLine)
	Q_UNUSED(inFile)
	Q_UNUSED(inFunction)
#endif

}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mInfo(
	const char *inMessage, int inLine, const char *inFile, const char *inFunction
) {

	A_LOGGER_CREATE_MESSAGE_FROM_CPP;
	emit sgWriteToLogInfo(oMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mWarning(
	const char *inMessage, int inLine, const char *inFile, const char *inFunction
) {

	A_LOGGER_CREATE_MESSAGE_FROM_CPP;
	emit sgWriteToLogWarning(oMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mCritical(
	const char *inMessage, int inLine, const char *inFile, const char *inFunction
) {

	A_LOGGER_CREATE_MESSAGE_FROM_CPP;
	emit sgWriteToLogCritical(oMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mQMLDebug(
	QString inActor, QString inMessage, QString inFile, QString inLine, QString inFunction
) {

	qDebug() << "inActor" << inActor << inActor.toLocal8Bit().data();
	qDebug() << "inMessage" << inMessage << inMessage.toLocal8Bit().data();
	qDebug() << "inFile" << inFile << inFile.toLocal8Bit().data();
	qDebug() << "inLine" << inLine << inLine.toLocal8Bit().data();
	qDebug() << "inFunction" << inFunction << inFunction.toLocal8Bit().data();

#ifdef QT_DEBUG
	ALoggerMessageModel* oMessage = new ALoggerMessageModel();
	oMessage->Time = QDateTime::currentMSecsSinceEpoch();
	oMessage->Actor = inActor.toLocal8Bit().data();
	oMessage->Message = inMessage.toLocal8Bit().data();
	oMessage->Line = inLine.toInt();
	oMessage->File = inFile.toLocal8Bit().data();
	oMessage->Function = inFunction.toLocal8Bit().data();
	emit sgWriteToLogDebug(oMessage);
#else
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

void ALogger::mQMLInfo(
	QString inActor, QString inMessage, QString inFile, QString inLine, QString inFunction
) {

	A_LOGGER_CREATE_MESSAGE_FROM_QML;
	emit sgWriteToLogInfo(oMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mQMLWarning(
	QString inActor, QString inMessage, QString inFile, QString inLine, QString inFunction
) {

	A_LOGGER_CREATE_MESSAGE_FROM_QML;
	emit sgWriteToLogWarning(oMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mQMLCritical(
	QString inActor, QString inMessage, QString inFile, QString inLine, QString inFunction
) {

	A_LOGGER_CREATE_MESSAGE_FROM_QML;
	emit sgWriteToLogCritical(oMessage);
}


// -----------
/*!
	\fn

	Doc.
*/


void ALogger::mLogUpdated(void) {

	emit sgLogUpdated();
}

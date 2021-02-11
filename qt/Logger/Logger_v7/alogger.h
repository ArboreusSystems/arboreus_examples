// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2021 at 14:30:47
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QObject>
#include <QDateTime>
#include <QString>

// Application includes
#include "aloggerservice.h"
#include "aloggerdatamodels.h"
#include "aproperties.h"
#include "athreadtemplate.h"

// Constants and definitions
#define A_LOGGER_CREATE_MESSAGE_FROM_CPP \
	ALoggerMessageModel* oMessage = new ALoggerMessageModel(); \
	oMessage->Time = QDateTime::currentMSecsSinceEpoch(); \
	oMessage->Actor = "SYS"; \
	oMessage->Message = inMessage; \
	oMessage->Line = inLine; \
	oMessage->File = inFile; \
	oMessage->Function = inFunction
#define A_LOGGER_CREATE_MESSAGE_FROM_QML \
	ALoggerMessageModel* oMessage = new ALoggerMessageModel(); \
	oMessage->Time = QDateTime::currentMSecsSinceEpoch(); \
	oMessage->Actor = inActor.toLocal8Bit().data(); \
	oMessage->Message = inMessage.toLocal8Bit().data(); \
	oMessage->Line = inLine.toInt(); \
	oMessage->File = inFile.toLocal8Bit().data(); \
	oMessage->Function = inFunction.toLocal8Bit().data()

#define A_LOGGER_DEBUG(inMessage) \
	(&ALogger::mInstance())->mDebug(inMessage,__LINE__,__FILE__,__FUNCTION__)
#define A_LOGGER_INFO(inMessage) \
	(&ALogger::mInstance())->mInfo(inMessage,__LINE__,__FILE__,__FUNCTION__)
#define A_LOGGER_WARNING(inMessage) \
	(&ALogger::mInstance())->mWarning(inMessage,__LINE__,__FILE__,__FUNCTION__)
#define A_LOGGER_CRITICAL(inMessage) \
	(&ALogger::mInstance())->mCritical(inMessage,__LINE__,__FILE__,__FUNCTION__)

// Namespace

// Class definitions
class ALogger : public QObject {

	Q_OBJECT

	public:

		AThreadTemplate* pThread = nullptr;
		AProperties* pProperties = nullptr;
		ALoggerService* pService = nullptr;

		static ALogger& mInstance(void);
		void mInitWithThread(AThreadTemplate* inThread);
		void mDebug(const char* inMessage, int inLine, const char* inFile, const char* inFunction);
		void mInfo(const char* inMessage, int inLine, const char* inFile, const char* inFunction);
		void mWarning(const char* inMessage, int inLine, const char* inFile, const char* inFunction);
		void mCritical(const char* inMessage, int inLine, const char* inFile, const char* inFunction);

	public slots:

		void mLogUpdated(void);
		void mQMLDebug(QString inActor,QString inMessage,QString inFile,QString inLine,QString inFunction);
		void mQMLInfo(QString inActor,QString inMessage,QString inFile,QString inLine,QString inFunction);
		void mQMLWarning(QString inActor,QString inMessage,QString inFile,QString inLine,QString inFunction);
		void mQMLCritical(QString inActor,QString inMessage,QString inFile,QString inLine,QString inFunction);

	signals:

		void sgWriteToLogDebug(ALoggerMessageModel* inMessage);
		void sgWriteToLogInfo(ALoggerMessageModel* inMessage);
		void sgWriteToLogWarning(ALoggerMessageModel* inMessage);
		void sgWriteToLogCritical(ALoggerMessageModel* inMessage);
		void sgLogUpdated(void);

	private:

		explicit ALogger(QObject* parent = nullptr);
		virtual ~ALogger(void);
		Q_DISABLE_COPY(ALogger)
};

#endif // ALOGGER_H

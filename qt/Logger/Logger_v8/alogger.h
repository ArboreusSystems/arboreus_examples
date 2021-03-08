// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/03/2021 at 13:38:42
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes

// Application includes
#include <aloggerglobal.h>
#include <aloggerdatamodels.h>
#include <aloggerservice.h>
#include <aproperties.h>
#include <athreadtemplate.h>

// Constants and definitions
#define A_LOGGER_DEBUG(inMessage) \
	(&ALogger::mInstance())->mWriteToLogDebug(inMessage,__FILE__,__LINE__,__FUNCTION__)
#define A_LOGGER_INFO(inMessage) \
	(&ALogger::mInstance())->mWriteToLogInfo(inMessage,__FILE__,__LINE__,__FUNCTION__)
#define A_LOGGER_WARNING(inMessage) \
	(&ALogger::mInstance())->mWriteToLogWarning(inMessage,__FILE__,__LINE__,__FUNCTION__)
#define A_LOGGER_CRITICAL(inMessage) \
	(&ALogger::mInstance())->mWriteToLogCritical(inMessage,__FILE__,__LINE__,__FUNCTION__)

// Namespace
namespace ARB {

// Class definitions
class ALogger : public QObject {

	Q_OBJECT

	public:

		AThreadTemplate* pThread = nullptr;
		AProperties* pProperties = nullptr;
		ALoggerService* pService = nullptr;

		static ALogger& mInstance(void);
		void mInitWithThread(AThreadTemplate* inThread);

		void mWriteToLogDebug(
			const char* inMessage,const char* inFile,int inLine,const char* inFunction
		);
		void mWriteToLogInfo(
			const char* inMessage,const char* inFile,int inLine,const char* inFunction
		);
		void mWriteToLogWarning(
			const char* inMessage,const char* inFile,int inLine,const char* inFunction
		);
		void mWriteToLogCritical(
			const char* inMessage,const char* inFile,int inLine,const char* inFunction
		);

	public slots:

		void slLogUpdated(void);
		void slWriteToLogDebug(QString inActor,QString inMessage,QString inInfo);
		void slWriteToLogInfo(QString inActor,QString inMessage,QString inInfo);
		void slWriteToLogWarning(QString inActor,QString inMessage,QString inInfo);
		void slWriteToLogCritical(QString inActor,QString inMessage,QString inInfo);

	signals:

		void sgWriteToLog(ALoggerMessageModel* inMessage);
		void sgLogUpdated(void);

	private:

		explicit ALogger(QObject* parent = nullptr);
		virtual ~ALogger(void);
		Q_DISABLE_COPY(ALogger)

		void mWriteToLog(
			QString inType, QString inActor, QString inMessage,
			QString inFile, QString inLine, QString inFunction
		);
};

} // namespace ARB

#endif // ALOGGER_H

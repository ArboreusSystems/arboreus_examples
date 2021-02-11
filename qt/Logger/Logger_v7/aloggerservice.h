// ----------------------------------------------------------
/*!
	\headerfile ALoggerService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2021 at 14:31:14
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGERSERVICE_H
#define ALOGGERSERVICE_H

// System includes
#include <QObject>
#include <QDateTime>
#include <QDebug>
#include <string>

// Application includes
#include "aloggerdatamodels.h"

// Constants and definitions
#define A_LOGGER_DEFAULT_STRING_DEBUG "DBG"
#define A_LOGGER_DEFAULT_STRING_INFO "INF"
#define A_LOGGER_DEFAULT_STRING_WARNING "WRN"
#define A_LOGGER_DEFAULT_STRING_CRITICAL "CRT"

#define A_CONSOLE_DEBUG(inMessage) \
	ALoggerService::mWriteToConsoleDebug( \
		QDateTime::currentMSecsSinceEpoch(), \
		"SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
	);
#define A_CONSOLE_INFO(inMessage) \
	ALoggerService::mWriteToConsoleInfo( \
		QDateTime::currentMSecsSinceEpoch(), \
		"SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
	);
#define A_CONSOLE_WARNING(inMessage) \
	ALoggerService::mWriteToConsoleWarning( \
		QDateTime::currentMSecsSinceEpoch(), \
		"SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
	);
#define A_CONSOLE_CRITICAL(inMessage) \
	ALoggerService::mWriteToConsoleCritical( \
		QDateTime::currentMSecsSinceEpoch(), \
		"SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
	);

// Namespace

// Class definitions
class ALoggerService : public QObject {

	Q_OBJECT

	public:

		explicit ALoggerService(QObject *parent = nullptr);
		virtual ~ALoggerService(void);

		static void mWriteToConsoleDebug(
			uint64_t inTime, const char* inActor,const char* inMessage,
			int inLine, const char* inFile,	const char* inFunction
		);
		static void mWriteToConsoleInfo(
			uint64_t inTime, const char* inActor,const char* inMessage,
			int inLine, const char* inFile,	const char* inFunction
		);
		static void mWriteToConsoleWarning(
			uint64_t inTime, const char* inActor,const char* inMessage,
			int inLine, const char* inFile,	const char* inFunction
		);
		static void mWriteToConsoleCritical(
			uint64_t inTime, const char* inActor,const char* inMessage,
			int inLine, const char* inFile,	const char* inFunction
		);

	public slots:

		void mWriteToLogDebug(ALoggerMessageModel* inMessage);
		void mWriteToLogInfo(ALoggerMessageModel* inMessage);
		void mWriteToLogWarning(ALoggerMessageModel* inMessage);
		void mWriteToLogCritical(ALoggerMessageModel* inMessage);

	signals:

		void sgLogUpdated(void);

	private:

		static std::string mCreateLogInfo(
			int inLine, const char* inFile,	const char* inFunction
		);
		static std::string mCreateLogType(
			const char* inType, const char* inActor
		);
		void mWriteToDB(
			uint64_t inTime, const char* inType, const char* inActor,
			const char* inMessage,
			int inLine, const char* inFile,	const char* inFunction
		);
		void mWriteToConsole(
			uint64_t inTime, const char* inType, const char* inActor,
			const char* inMessage,
			int inLine, const char* inFile,	const char* inFunction
		);
};

#endif // ALOGGERSERVICE_H

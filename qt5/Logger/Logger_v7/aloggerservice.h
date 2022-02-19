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
#define A_LOGGER_DEFAULT_STRING_SYSTEM "SYS"
#define A_LOGGER_DEFAULT_STRING_QML "QML"
#define A_LOGGER_DEFAULT_STRING_USER "USR"

#define A_CONSOLE_MESSAGE_DEBUG(inMessage) \
	ALoggerService::mWriteToConsole( \
		QDateTime::currentMSecsSinceEpoch(),A_LOGGER_DEFAULT_STRING_DEBUG, \
		"SYS",inMessage,__FILE__,__LINE__,__FUNCTION__ \
	)
#define A_CONSOLE_MESSAGE_INFO(inMessage) \
	ALoggerService::mWriteToConsole( \
		QDateTime::currentMSecsSinceEpoch(),A_LOGGER_DEFAULT_STRING_INFO, \
		"SYS",inMessage,__FILE__,__LINE__,__FUNCTION__ \
	)
#define A_CONSOLE_MESSAGE_WARNING(inMessage) \
	ALoggerService::mWriteToConsole( \
		QDateTime::currentMSecsSinceEpoch(),A_LOGGER_DEFAULT_STRING_WARNING, \
		"SYS",inMessage,__FILE__,__LINE__,__FUNCTION__ \
	)
#define A_CONSOLE_MESSAGE_CRITICAL(inMessage) \
	ALoggerService::mWriteToConsole( \
		QDateTime::currentMSecsSinceEpoch(),A_LOGGER_DEFAULT_STRING_CRITICAL, \
		"SYS",inMessage,__FILE__,__LINE__,__FUNCTION__ \
	)

// Namespace

// Class definitions
class ALoggerService : public QObject {

	Q_OBJECT

	public:

		explicit ALoggerService(QObject *parent = nullptr);
		virtual ~ALoggerService(void);

		static void mWriteToConsole(
			uint64_t inTime, const char* inType, const char* inActor,
			const char* inMessage,
			const char* inFile,int inLine,const char* inFunction
		);

	public slots:

		void slWriteToLog(ALoggerMessageModel* inMessage);

	signals:

		void sgLogUpdated(void);

	private:

		void mWriteToDB(ALoggerMessageModel* inMessage);

};

#endif // ALOGGERSERVICE_H

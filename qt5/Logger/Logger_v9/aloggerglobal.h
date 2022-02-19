// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 16:41:52
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGERGLOBAL_H
#define ALOGGERGLOBAL_H

// System includes
#include <QObject>
#include <QDateTime>
#include <QDebug>
#include <QThread>
#include <string>

// Application includes

// Constants and defintions
#define A_LOGGER_MESSAGE_INIT std::string oMessage("NoLoggerMessage")

#define A_LOGGER_DEFAULT_STRING_DEBUG "DBG"
#define A_LOGGER_DEFAULT_STRING_INFO "INF"
#define A_LOGGER_DEFAULT_STRING_WARNING "WRN"
#define A_LOGGER_DEFAULT_STRING_CRITICAL "CRT"
#define A_LOGGER_DEFAULT_STRING_SYSTEM "SYS"
#define A_LOGGER_DEFAULT_STRING_QML "QML"
#define A_LOGGER_DEFAULT_STRING_USER "USR"

#define A_CONSOLE_MESSAGE_DEBUG(inMessage) \
	fLoggerWriteToConsole( \
		QDateTime::currentMSecsSinceEpoch(),A_LOGGER_DEFAULT_STRING_DEBUG, \
		A_LOGGER_DEFAULT_STRING_SYSTEM,inMessage,__FILE__,__LINE__,__FUNCTION__ \
	)
#define A_CONSOLE_MESSAGE_INFO(inMessage) \
	fLoggerWriteToConsole( \
		QDateTime::currentMSecsSinceEpoch(),A_LOGGER_DEFAULT_STRING_INFO, \
		A_LOGGER_DEFAULT_STRING_SYSTEM,inMessage,__FILE__,__LINE__,__FUNCTION__ \
	)
#define A_CONSOLE_MESSAGE_WARNING(inMessage) \
	fLoggerWriteToConsole( \
		QDateTime::currentMSecsSinceEpoch(),A_LOGGER_DEFAULT_STRING_WARNING, \
		A_LOGGER_DEFAULT_STRING_SYSTEM,inMessage,__FILE__,__LINE__,__FUNCTION__ \
	)
#define A_CONSOLE_MESSAGE_CRITICAL(inMessage) \
	fLoggerWriteToConsole( \
		QDateTime::currentMSecsSinceEpoch(),A_LOGGER_DEFAULT_STRING_CRITICAL, \
		A_LOGGER_DEFAULT_STRING_SYSTEM,inMessage,__FILE__,__LINE__,__FUNCTION__ \
	)

// Namespace

// Global functions

// -----------
/*!
	\fn

	Doc.
*/

static void __attribute__((unused)) fLoggerWriteToConsole(
	uint64_t inTime, const char* inType, const char* inActor,
	const char* inMessage,
	const char* inFile,int inLine,const char* inFunction
) {

#ifdef QT_DEBUG

	std::string oType = "[" + std::string(inType) + "]:[" + std::string(inActor) +"]";
	std::string oInfo = "[" + std::string(inFile) + "]:[" + std::to_string(inLine) + "]:[" + std::string(inFunction) + "]";

	qDebug() <<	inTime << QThread::currentThreadId() << oType.c_str() << inMessage << oInfo.c_str();

#else

	Q_UNUSED(inTime);
	Q_UNUSED(inType);
	Q_UNUSED(inActor);
	Q_UNUSED(inMessage);
	Q_UNUSED(inFile);
	Q_UNUSED(inLine);
	Q_UNUSED(inFunction);

#endif
}


#endif // ALOGGERGLOBAL_H

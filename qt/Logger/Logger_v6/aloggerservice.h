// ----------------------------------------------------------
/*!
	\headerfile ALoggerService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2021 at 21:26:31
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGERSERVICE_H
#define ALOGGERSERVICE_H

// System includes
#include <QObject>
#include <QDateTime>

// Application includes
#include "aloggerdatamodels.h"

// Constants and definitions
#define A_CONSOLE_DEBUG(inMessage) \
	ALoggerService::mConsoleMessageDebug( \
		QDateTime::currentMSecsSinceEpoch(),"DBG","SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
	)
#define A_CONSOLE_INFO(inMessage) \
	ALoggerService::mConsoleMessage( \
		QDateTime::currentMSecsSinceEpoch(),"INF","SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
	)
#define A_CONSOLE_WARNING(inMessage) \
	ALoggerService::mConsoleMessage( \
		QDateTime::currentMSecsSinceEpoch(),"WRN","SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
	)
#define A_CONSOLE_ERROR(inMessage) \
	ALoggerService::mConsoleMessage( \
		QDateTime::currentMSecsSinceEpoch(),"ERR","SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
	)
#define A_CONSOLE_CRITICAL(inMessage) \
	ALoggerService::mConsoleMessage( \
		QDateTime::currentMSecsSinceEpoch(),"CRI","SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
	)

// Namespace

// Class definitions
class ALoggerService : public QObject {

	Q_OBJECT

	public:

		explicit ALoggerService(QObject *parent = nullptr);
		virtual ~ALoggerService(void);

		static void mConsoleMessageDebug(
			uint64_t inTime, const char* inType, const char* inActor,
			const char* inMessage,
			int inLine, const char* inFile,	const char* inFunction
		);
		static void mConsoleMessage(
			uint64_t inTime, const char* inType, const char* inActor,
			const char* inMessage,
			int inLine, const char* inFile,	const char* inFunction
		);
};

#endif // ALOGGERSERVICE_H

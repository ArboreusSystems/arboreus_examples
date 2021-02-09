// ----------------------------------------------------------
/*!
	\class ALoggerService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2021 at 21:26:31
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

void ALoggerService::mConsoleMessageDebug(
	uint64_t inTime, const char *inType, const char *inActor,
	const char *inMessage,
	int inLine, const char *inFile, const char *inFunction
) {

#ifdef QT_DEBUG
	fprintf(stderr, "%llu [%s]:[%s] %s [%s]:[%u]:[%s]\n",
		inTime,inType,inActor,inMessage,inFile,inLine,inFunction
	);
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

void ALoggerService::mConsoleMessage(
	uint64_t inTime, const char *inType, const char *inActor,
	const char *inMessage,
	int inLine, const char *inFile, const char *inFunction
) {

	fprintf(stderr, "%llu [%s]:[%s] %s [%s]:[%u]:[%s]\n",
		inTime,inType,inActor,inMessage,inFile,inLine,inFunction
	);
}

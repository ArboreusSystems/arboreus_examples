// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2021 at 18:26:41
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGERFUNCTIONS_H
#define ALOGGERFUNCTIONS_H

// System includes
#include <QString>
#include <QDateTime>

// Application includes
#include "aloggerdatamodels.h"

//// Constants and defintions
//#define A_CONSOLE_DEBUG(inMessage) \
//	mConsoleMessage( \
//		QDateTime::currentMSecsSinceEpoch(),"DBG","SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
//	)
//#define A_CONSOLE_INFO(inMessage) \
//	mConsoleMessage( \
//		QDateTime::currentMSecsSinceEpoch(),"INF","SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
//	)
//#define A_CONSOLE_WARNING(inMessage) \
//	mConsoleMessage( \
//		QDateTime::currentMSecsSinceEpoch(),"WRN","SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
//	)
//#define A_CONSOLE_ERROR(inMessage) \
//	mConsoleMessage( \
//		QDateTime::currentMSecsSinceEpoch(),"ERR","SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
//	)
//#define A_CONSOLE_CRITICAL(inMessage) \
//	mConsoleMessage( \
//		QDateTime::currentMSecsSinceEpoch(),"CRI","SYS",inMessage,__LINE__,__FILE__,__FUNCTION__ \
//	)

//// Namespace

//// Functions
//void mConsoleMessage(
//	uint64_t inTime, const char* inType, const char* inActor,
//	const char* inMessage, int inLine, const char* inFile,
//	const char* inFunction
//) {

//	fprintf(stderr, "%llu [%s]:[%s] %s [%s]:[%u]:[%s]\n",
//		inTime,inType,inActor,inMessage,inFile,inLine,inFunction
//	);
//}

#endif // ALOGGERFUNCTIONS_H

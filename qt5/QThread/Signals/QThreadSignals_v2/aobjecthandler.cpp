// ----------------------------------------------------------
/*!
	\class AObjectHandler
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/11/2020 at 11:32:43
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjecthandler.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectHandler::AObjectHandler(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "AObjectHandler created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectHandler::~AObjectHandler(void) {

	ALOG_SYSTEM << "AObjectHandler deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObjectHandler::mTest(int inValue) {

	ALOG_SYSTEM << "AObjectHandler::mTest(void) with:" << inValue;
}

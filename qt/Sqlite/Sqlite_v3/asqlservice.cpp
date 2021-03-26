// ----------------------------------------------------------
/*!
	\class ASqlService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/03/2021 at 12:01:06
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asqlservice.h"


// -----------
/*!
	\fn

	Doc.
*/

ASqlService::ASqlService(QObject *parent) : ASqlTemplate(parent) {

	ALOG_SYSTEM << "ASqlService created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASqlService::~ASqlService(void) {

	ALOG_SYSTEM << "ASqlService deleted";
}


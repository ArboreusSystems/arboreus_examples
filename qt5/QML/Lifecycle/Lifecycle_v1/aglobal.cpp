// ----------------------------------------------------------
/*!
	\class AGlobal
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/09/2020 at 20:45:16
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aglobal.h"


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::AGlobal(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "AGlobal created";
}


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::~AGlobal(void) {

	ALOG_SYSTEM << "AGlobal deleted";
}

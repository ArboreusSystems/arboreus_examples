// ----------------------------------------------------------
/*!
	\class Alogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/10/2022 at 09:40:38
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alogger.h"


// -----------
/*!
	\fn

	Doc.
*/

Alogger::Alogger(QObject* parent) : QObject(parent) {

	_A_DEBUG << "Alogger created";
}


// -----------
/*!
	\fn

	Doc.
*/

Alogger::~Alogger(void) {

	_A_DEBUG << "Alogger deleted";
}


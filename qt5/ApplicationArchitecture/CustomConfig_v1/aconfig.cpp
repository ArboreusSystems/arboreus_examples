// ----------------------------------------------------------
/*!
	\class AConfig
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/05/2021 at 10:23:53
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aconfig.h"


// -----------
/*!
	\fn

	Doc.
*/

AConfig::AConfig(QObject *parent) : QObject(parent) {

	ALOG << "AConfig created";
}


// -----------
/*!
	\fn

	Doc.
*/

AConfig::~AConfig(void) {

	ALOG << "AConfig deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AConfig::mLoggerConfigValue(void) {

	QString oOutput("LoggerConfigValue");
	return oOutput;
}


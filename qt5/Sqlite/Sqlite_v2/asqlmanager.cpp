// ----------------------------------------------------------
/*!
	\class ASqlManager
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/03/2021 at 16:46:25
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asqlmanager.h"


// -----------
/*!
	\fn

	Doc.
*/

ASqlManager::ASqlManager(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "ASqlManager created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASqlManager::~ASqlManager(void) {

	ALOG_SYSTEM << "ASqlManager deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASqlManager::mAddDatabase(ASqlDatabaseProperties *inProperties) {

	ALOG_SYSTEM << "Adding database with properties:" << inProperties->Path.toStdString().c_str();
	emit sgAddDatabase(inProperties);
}

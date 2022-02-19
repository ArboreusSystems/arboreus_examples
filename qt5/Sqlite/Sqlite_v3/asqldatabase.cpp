// ----------------------------------------------------------
/*!
	\class ASqlDatabase
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/03/2021 at 12:05:47
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asqldatabase.h"


// -----------
/*!
	\fn

	Doc.
*/

ASqlDatabase::ASqlDatabase(QObject* parent) : QObject(parent) {

	ALOG_SYSTEM << "ASqlDatabase created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASqlDatabase::~ASqlDatabase(void) {

	ALOG_SYSTEM << "ASqlDatabase deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASqlDatabase::mInit(ASqlDatabaseProperties* inProperties) {

	ALOG_SYSTEM << "Initialising db";
	emit sgInit(inProperties);
}

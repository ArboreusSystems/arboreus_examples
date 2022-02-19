// ----------------------------------------------------------
/*!
	\class ASqlDatabase
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/03/2021 at 16:25:40
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

ASqlDatabase::ASqlDatabase(QObject *parent) : QObject(parent) {

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

void ASqlDatabase::slAddDatabase(ASqlDatabaseProperties *inProperties) {

	pProperties = inProperties;

	QSqlDatabase oDB = QSqlDatabase::addDatabase("QSQLITE",pProperties->Name);
	oDB.setDatabaseName(pProperties->Path);
	if (oDB.open()) {
		ALOG_SYSTEM << "Adding database with properties:" << pProperties->Path.toStdString().c_str();
	} else {
		ALOG_SYSTEM << "No DB with properties:" << pProperties->Path.toStdString().c_str();
	}
}

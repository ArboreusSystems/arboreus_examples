// ----------------------------------------------------------
/*!
	\class ADbSqlite
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 15:08:58
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adbsqlite.h"


// -----------
/*!
	\fn

	Doc.
*/

ADbSqlite::ADbSqlite(QObject *parent) : QObject(parent) {

	ALOG << "ADbSqlite created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADbSqlite::~ADbSqlite(void) {

	ALOG << "ADbSqlite deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADbSqlite::mStart(ADbSqliteProperties *inProperties) {

	pName = inProperties->Name;
	pPath = inProperties->Path;

	ALOG << "DB Drivers:" << QSqlDatabase::drivers();

	QSqlDatabase oDb = QSqlDatabase::addDatabase("SQLITECIPHER",pName);
	oDb.setDatabaseName(pPath);
	if (oDb.open()) {
		ALOG << "Opened DB ->" << inProperties->Path.toStdString().c_str();
	} else {
		ALOG << "Failed to open DB ->" << inProperties->Path.toStdString().c_str();
	}
}


// -----------
/*!
	\fn

	Doc.
*/

bool ADbSqlite::mClose(void) {

	QSqlDatabase oDb = QSqlDatabase::database(pName);

	if (oDb.isOpen()) {
		oDb.close();
	} else {
		ALOG << "Can't close DB. It's not opended ->" << pPath.toStdString().c_str();
	}

	if (!oDb.isOpen()) {
		ALOG << "DB closed ->" << pPath.toStdString().c_str();
		return true;
	}

	ALOG << "Failed closing DB ->" << pPath.toStdString().c_str();
	return false;
}


// -----------
/*!
	\fn

	Doc.
*/

void ADbSqlite::mRemove(void) {

	if (this->mClose()) {
		QSqlDatabase::removeDatabase(pName);
		ALOG << "DB removed ->" << pPath.toStdString().c_str();
	} else {
		ALOG << "DB not closed. Can't be removed ->" << pPath.toStdString().c_str();
	}
}


// -----------
/*!
	\fn

	Doc.
*/

QString ADbSqlite::mGetName(void) {

	return pName;
}


// -----------
/*!
	\fn

	Doc.
*/

QString ADbSqlite::mGetPath(void) {

	return pPath;
}

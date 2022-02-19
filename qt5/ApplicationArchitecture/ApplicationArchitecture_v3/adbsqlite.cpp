// ----------------------------------------------------------
/*!
	\class ADbSqlite
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/03/2021 at 15:44:08
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

	A_DEBUG << "ADbSqlite created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADbSqlite::~ADbSqlite(void) {

	this->mRemove();

	A_DEBUG << "ADbSqlite deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

bool ADbSqlite::mStart(ADbSqliteProperties* inProperties) {

	pPropperties = inProperties;

	QSqlDatabase oDb = QSqlDatabase::addDatabase("QSQLITE",pPropperties->Name);
	oDb.setDatabaseName(pPropperties->Path);
	if (oDb.open()) {
		A_DEBUG << "Opened DB ->" << pPropperties->Path.toStdString().c_str();
		return true;
	} else {
		A_WARNING << "Failed to open DB ->" << pPropperties->Path.toStdString().c_str();
		return false;
	}
}


// -----------
/*!
	\fn

	Doc.
*/

bool ADbSqlite::mClose(void) {

	QSqlDatabase oDb = QSqlDatabase::database(pPropperties->Path);

	if (oDb.isOpen()) {
		oDb.close();
	} else {
		A_WARNING << "Can't close DB. It's not opended ->" << pPropperties->Path.toStdString().c_str();
	}

	if (!oDb.isOpen()) {
		A_DEBUG << "DB closed ->" << pPropperties->Path.toStdString().c_str();
		return true;
	}

	A_WARNING << "Failed closing DB ->" << pPropperties->Path.toStdString().c_str();
	return false;
}


// -----------
/*!
	\fn

	Doc.
*/

bool ADbSqlite::mRemove(void) {

	if (this->mClose()) {
		QSqlDatabase::removeDatabase(pPropperties->Path);
		A_DEBUG << "DB removed ->" << pPropperties->Path.toStdString().c_str();
		return true;
	} else {
		A_WARNING << "DB not closed. Can't be removed ->" << pPropperties->Path.toStdString().c_str();
		return false;
	}
}

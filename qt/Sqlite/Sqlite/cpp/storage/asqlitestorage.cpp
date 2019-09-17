// ----------------------------------------------------------
/*!
	\class aSqliteStorage
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/09/2019 at 21:17:33
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asqlitestorage.h"


// -----------
/*!
	\fn

	Doc.
*/

aSqliteStorage::aSqliteStorage(QObject *parent) : QObject(parent) {

	QString oDir = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
	if (!aDir::mEnsure(oDir)) {
		aLOG << "No directory for DB";
	}

	QString oFile = oDir + "/arboreus.db";
	aLOG << "DB file:" << oFile;
	if (aFile::mExist(oFile)) {
		aFile::mRemove(oFile);
	}

	if (!QSqlDatabase::isDriverAvailable("QSQLITE")) {
		aLOG << "No SQL driver. Available drivers:" << QSqlDatabase::drivers();
	} else {
		pDataBase = QSqlDatabase::addDatabase("QSQLITE");
		pDataBase.setDatabaseName(oFile);
		if (!pDataBase.open()) {
			aLOG << "No opened DB";
		} else {
			if (!mCreateDB()) {
				aLOG << "No created DB";
			}
		}
	}
}


// -----------
/*!
	\fn

	Doc.
*/

aSqliteStorage::~aSqliteStorage(void) {

	pDataBase.close();
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantList aSqliteStorage::mReadAllRecords(void) {

	QVariantList oOutput = {};

	QSqlQuery oQuery(pDataBase);
	QString oQueryString = QString(
		"SELECT * FROM " + QString(TABLE_NAME) + ";"
	);

	if (!oQuery.prepare(oQueryString)) {
		aLOG << "Query:" << oQueryString;
		aLOG << "Wrong query";
	}
	if (oQuery.exec()) {
		int oCounter = 0;
		while (oQuery.next()) {
			QList<QVariant> oRecord = {};
			for (int i = 0; i < QSqlRecord(oQuery.record()).count(); ++i) {
				oRecord.insert(i,oQuery.value(i));
			}
			oOutput.insert(oCounter,oRecord);
			++oCounter;
		}
	}

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

bool aSqliteStorage::mWriteRecord(QList<QString> inRecord) {

	QSqlQuery oQuery(pDataBase);
	QString oQueryString = QString(
		"INSERT OR REPLACE INTO "+ QString(TABLE_NAME) + "(string1,string2,string3) VALUES (" +
			"'" + QString(inRecord[0]) + "','" + QString(inRecord[1]) + "','" + QString(inRecord[2]) + "'" +
		");"
	);

	if (!oQuery.prepare(oQueryString)) {
		aLOG << "Query:" << oQueryString;
		aLOG << "No prepared query";
		return false;
	}
	if (!oQuery.exec()) {
		aLOG << "Writing data into DB failed";
		return false;
	}

	return true;
}


// -----------
/*!
	\fn

	Doc.
*/

bool aSqliteStorage::mCreateDB(void) {

	QSqlQuery oQuery(pDataBase);
	QString oQueryString = QString(
		"CREATE TABLE IF NOT EXISTS " + QString(TABLE_NAME) + " (" +
			"string1 STRING(64) PRIMARY KEY UNIQUE NOT NULL," +
			"string2 STRING(64)," +
			"string3 STRING(64)" +
		");"
	);

	if (!oQuery.prepare(oQueryString)) {
		aLOG << "Query:" << oQueryString;
		aLOG << "No prepared query";
		return false;
	}
	if (!oQuery.exec()) {
		aLOG << "Creating table in DB failed";
		return false;
	}

	return true;
}

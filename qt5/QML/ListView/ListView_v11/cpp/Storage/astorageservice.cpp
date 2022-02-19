// ----------------------------------------------------------
/*!
	\class AStorageService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/07/2021 at 23:13:39
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "astorageservice.h"


// -----------
/*!
	\fn

	Doc.
*/

AStorageService::AStorageService(QObject *parent) : AThreadServiceTemplate(parent) {

	_A_DEBUG << "AStorageService created";
}


// -----------
/*!
	\fn

	Doc.
*/

AStorageService::~AStorageService(void) {

	ADir::mRemoveRecursively(pPathStorageData);

	_A_DEBUG << "AStorageService deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

ADBSqlCipher* AStorageService::mGetDB(void) {

	return pDB;
}


// -----------
/*!
	\fn

	Doc.
*/

void AStorageService::slInit(QString inPathStorageData) {

	pPathStorageData = inPathStorageData;

	ADBSqlCipherProperties oDBProperties;
	oDBProperties.Name = "test_" + QString::number(QDateTime::currentMSecsSinceEpoch());
	oDBProperties.Path = pPathStorageData + "/" + oDBProperties.Name + ".db";

	QString oQueryString = QString(
		"CREATE TABLE IF NOT EXISTS test ("
			"id INTEGER PRIMARY KEY AUTOINCREMENT,"
			"first_name TEXT,"
			"last_name TEXT,"
			"phone_number TEXT"
		")"
	);

	pDB = new ADBSqlCipher(this);
	if (pDB->mStart(&oDBProperties)) {
		ADBSqlCipherReply oDBReply = pDB->mStringExecute(oQueryString);
		if (!oDBReply.Status) _A_CRITICAL << "Creating table failed";
	}

	_A_DEBUG << "AStorageService initiated";
	emit sgInitiated();
}


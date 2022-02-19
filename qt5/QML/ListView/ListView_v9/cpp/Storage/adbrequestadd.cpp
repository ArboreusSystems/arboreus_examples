// ----------------------------------------------------------
/*!
	\class ADBRequestAdd
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/08/2021 at 20:38:04
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adbrequestadd.h"


// -----------
/*!
	\fn

	Doc.
*/

ADBRequestAdd::ADBRequestAdd(ADBSqlCipher* inDB, QObject* parent) : AThreadObjectTemplate(parent) {

	pDB = inDB;

	_A_DEBUG << "ADBRequestAdd created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADBRequestAdd::~ADBRequestAdd(void) {

	_A_DEBUG << "ADBRequestAdd deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADBRequestAdd::slRun(void) {

	QSqlQuery oSqlQuery(pDB->mGetDB());
	oSqlQuery.prepare(
		"INSERT INTO test (first_name,last_name,phone_number)"
		"VALUES (:first_name,:last_name,:phone_number);"
	);
	oSqlQuery.bindValue(":first_name",pModel.FirstName);
	oSqlQuery.bindValue(":last_name",pModel.LastName);
	oSqlQuery.bindValue(":phone_number",pModel.PhoneNumber);

	ADBSqlCipherReply oDBReply = pDB->mQueryExecute(oSqlQuery);
	if (!oDBReply.Status) {
		_A_CRITICAL << "Adding data to table failed";
	} else {
		_A_DEBUG << "Added row with FirstName:" << pModel.FirstName << "LastName:" << pModel.LastName << "ROWID:" << pDB->mLastRowID();
		pResult.append(pDB->mLastRowID());
	}

	emit sgFinished();
}


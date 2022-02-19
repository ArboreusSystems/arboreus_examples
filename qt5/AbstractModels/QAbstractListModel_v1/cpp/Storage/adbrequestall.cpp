// ----------------------------------------------------------
/*!
	\class ADBRequestGetAll
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/08/2021 at 19:27:59
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adbrequestall.h"


// -----------
/*!
	\fn

	Doc.
*/

ADBRequestAll::ADBRequestAll(ADBSqlCipher* inDB, QObject* parent) : AThreadObjectTemplate(parent) {

	pDB = inDB;

	_A_DEBUG << "ADBRequestGetAll created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADBRequestAll::~ADBRequestAll(void) {

	_A_DEBUG << "ADBRequestGetAll deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADBRequestAll::slRun(void) {

	ADBSqlCipherReply oDBReply = pDB->mStringExecute(QString("SELECT * FROM test;"));
	if (!oDBReply.Status) {
		_A_CRITICAL << "Selecting all data from table failed";
	} else {
		_A_DEBUG << "Selected all records from DB";
	}
	pResult = oDBReply.Output;

	emit sgFinished();
}


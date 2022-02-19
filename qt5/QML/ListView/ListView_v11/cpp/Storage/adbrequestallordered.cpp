// ----------------------------------------------------------
/*!
	\class ADBRequestAllOrdered
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/10/2021 at 13:17:26
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adbrequestallordered.h"


// -----------
/*!
	\fn

	Doc.
*/

ADBRequestAllOrdered::ADBRequestAllOrdered(
	QString inFiledName,
	_A_ENUM_DB_SORTING_DIRECTION inDirection,
	ADBSqlCipher* inDB,
	QObject* parent
) : AThreadObjectTemplate(parent) {

	pFieldName = inFiledName;
	pDirection = inDirection;
	pDB = inDB;

	_A_DEBUG << "ADBRequestAllOrdered created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADBRequestAllOrdered::~ADBRequestAllOrdered(void) {

	_A_DEBUG << "ADBRequestAllOrdered deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADBRequestAllOrdered::slRun(void) {

	QString oSQLString = "SELECT * FROM test ORDER BY " + pFieldName;
	if (pDirection == _A_ENUM_DB_SORTING_DIRECTION::Ascendant) {
		oSQLString += " ASC;";
	} else {
		oSQLString += " DESC;";
	}

	ADBSqlCipherReply oDBReply = pDB->mStringExecute(oSQLString);
	if (!oDBReply.Status) {
		_A_CRITICAL << "Selecting all data from table failed";
	} else {
		_A_DEBUG << "Selected all records from DB";
	}
	pResult = oDBReply.Output;

	emit sgFinished();
}


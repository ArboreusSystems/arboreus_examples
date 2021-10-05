// ----------------------------------------------------------
/*!
	\class ARequestTableFieldNames
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/09/2021 at 09:11:33
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adbrequesttablefieldnames.h"


// -----------
/*!
	\fn

	Doc.
*/

ADBRequestTableFieldNames::ADBRequestTableFieldNames(ADBSqlCipher* inDB,QObject *parent) : AThreadObjectTemplate(parent) {

	pDB = inDB;

	_A_DEBUG << "ARequestTableFieldNames created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADBRequestTableFieldNames::~ADBRequestTableFieldNames(void) {

	_A_DEBUG << "ARequestTableFieldNames deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADBRequestTableFieldNames::slRun(void) {

	QString oTableName("test");
	ADBSqlCipherReply oDBReply = pDB->mGetTableFieldNames(oTableName);
	if (!oDBReply.Status) {
		_A_CRITICAL << "Getting table:" << oTableName << "field names failed";
	} else {
		_A_DEBUG << "Getting table:" << oTableName << "field names";
	}

	pResult = oDBReply.Output;

	emit sgFinished();
}

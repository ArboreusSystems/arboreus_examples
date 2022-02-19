// ----------------------------------------------------------
/*!
	\class ADBRequestTableInfo
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/09/2021 at 18:00:18
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adbrequesttableinfo.h"


// -----------
/*!
	\fn

	Doc.
*/

ADBRequestTableInfo::ADBRequestTableInfo(ADBSqlCipher* inDB,QObject *parent) : AThreadObjectTemplate(parent) {

	pDB = inDB;

	_A_DEBUG << "ADBRequestTableInfo created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADBRequestTableInfo::~ADBRequestTableInfo(void) {

	_A_DEBUG << "ADBRequestTableInfo deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADBRequestTableInfo::slRun(void) {

	QString oTableName("test");
	ADBSqlCipherReply oDBReply = pDB->mGetTableInfo(oTableName);
	if (!oDBReply.Status) {
		_A_CRITICAL << "Getting table:" << oTableName << "info failed";
	} else {
		_A_DEBUG << "Getting table:" << oTableName << "info";
	}

	pResult = oDBReply.Output;

	emit sgFinished();
}


// ----------------------------------------------------------
/*!
	\class AObjectService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 14:55:23
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjectservice.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectService::AObjectService(QObject *parent) : AThreadServiceTemplate(parent) {

	ALOG << "AObjectService created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectService::~AObjectService(void) {

	if (pDatabase) {
		pDatabase->mRemove();
		pDatabase->deleteLater();
	}

	ALOG << "AObjectService deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObjectService::slInitService(void) {

	pDatabase = new ADbSqlite();

	ADbSqliteProperties* oProperties = new ADbSqliteProperties();
	oProperties->Name = "TestDB";
	oProperties->Path = AProperties::mGetTestDbPath() + "/" + oProperties->Name + ".db";
	pDatabase->mStart(oProperties);

	ALOG << "AObjectService initialised";
}

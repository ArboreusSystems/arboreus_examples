// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/03/2021 at 13:47:28
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alogger.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

ALogger::ALogger(QObject* parent) : AThread<ALoggerService>(new ALoggerService, parent) {

	QObject::connect(
		this,&ALogger::sgInit,
		this->mService(),&ALoggerService::slInit
	);

	A_DEBUG << "ALogger created";
}


// -----------
/*!
	\fn

	Doc.
*/

ALogger::~ALogger(void) {

	A_DEBUG << "ALogger deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ALogger::mInit() {

	pBackend = &ABackend::mInstance();

	QString oDir = pBackend->pProperties->mGetPathDataApplication() + "/Logs";
	ADir::mEnsure(oDir);

	ADbSqliteProperties* oProperties = new ADbSqliteProperties();
	oProperties->Name = QString("Alogger");
	oProperties->Path = oDir + "/" + oProperties->Name + ".db";
	emit sgInit(oProperties);

	A_DEBUG << "ALogger initialised";
}


// ----------------------------------------------------------
/*!
	\class AProperties
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/04/2021 at 14:08:52
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aproperties.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

AProperties::AProperties(QObject *parent) : QObject(parent) {

	ALOG << "AProperties created";
}


// -----------
/*!
	\fn

	Doc.
*/

AProperties::~AProperties(void) {

	ALOG << "AProperties deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AProperties::mInit(void) {

	pBackend = &ABackend::mInstance();

	pPathApplicationData = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) +
		"/DownloadFile_v2/NetworkCache";
	if (ADir::mEnsure(pPathApplicationData)) {
		ALOG << "Ensured path:" << pPathApplicationData.toStdString().c_str();
	} else {
		ALOG << "Failed ensuring path:" << pPathApplicationData.toStdString().c_str();
	}

	ALOG << "AProperties initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mPathApplicationData(void) {

	return pPathApplicationData;
}

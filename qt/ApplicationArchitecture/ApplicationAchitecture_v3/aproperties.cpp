// ----------------------------------------------------------
/*!
	\class AProperties
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/03/2021 at 15:11:43
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

	A_DEBUG << "AProperties created";
}


// -----------
/*!
	\fn

	Doc.
*/

AProperties::~AProperties(void) {

	A_DEBUG << "AProperties deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AProperties::mInit(void) {

	pBackend = &ABackend::mInstance();

	pPathDataApplication = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) + "/ApplicationArchitecture_v3";
	if (ADir::mEnsure(pPathDataApplication)) {
		A_DEBUG << "Ensured Application Data path ->" << pPathDataApplication.toStdString().c_str();
	} else {
		A_WARNING << "No Application Data path ->" << pPathDataApplication.toStdString().c_str();
	}

	A_DEBUG << "AProperties initialised";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mGetPathDataApplication(void) {

	return pPathDataApplication;
}

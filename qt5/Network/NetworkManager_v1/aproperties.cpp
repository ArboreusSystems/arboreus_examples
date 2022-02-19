// ----------------------------------------------------------
/*!
	\class AProperties
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/04/2021 at 16:47:58
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

void AProperties::slInit(void) {

	pBackend = &ABackend::mInstance();

	pPathApplicationData = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) + "/NetworkManager_v1";
	if (ADir::mEnsure(pPathApplicationData)) {
		ALOG << "Ensured path:" << pPathApplicationData.toStdString().c_str();
	} else {
		ALOG << "Failed ensuring path:" << pPathApplicationData.toStdString().c_str();
	}

	pPathNetworkCache = pPathApplicationData + "/NetworkCache";
	if (ADir::mEnsure(pPathNetworkCache)) {
		ALOG << "Ensured path:" << pPathNetworkCache.toStdString().c_str();
	} else {
		ALOG << "Failed ensuring path:" << pPathNetworkCache.toStdString().c_str();
	}

	ALOG << "AProperties initialised";
	emit sgInitialised();
}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mPathApplicationData(void) {

	return pPathApplicationData;
}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mPathNetworkCache(void) {

	return pPathNetworkCache;
}

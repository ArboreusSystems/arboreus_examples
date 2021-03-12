// ----------------------------------------------------------
/*!
	\class AProperties
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/03/2021 at 17:42:38
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aproperties.h"


// -----------
/*!
	\fn

	Doc.
*/

AProperties::AProperties(QObject *parent) : QObject(parent) {

	pPathApplicationData = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) + "/" + pNameApplication;
	if (ADir::mEnsure(pPathApplicationData)) {
		ALOG_SYSTEM << "Application data path:" << pPathApplicationData.data();
	} else {
		ALOG_SYSTEM << "No Application data path:" << pPathApplicationData.data();
	}

	pPathDB = pPathApplicationData + "/DB";
	if (ADir::mEnsure(pPathDB)) {
		ALOG_SYSTEM << "Application data path:" << pPathDB.data();
	} else {
		ALOG_SYSTEM << "No Application data path:" << pPathDB.data();
	}

	ALOG_SYSTEM << "AProperties created";
}


// -----------
/*!
	\fn

	Doc.
*/

AProperties::~AProperties(void) {

	ALOG_SYSTEM << "AProperties deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

AProperties& AProperties::mInstance(void) {

	ALOG_SYSTEM << "AProperties instantiating";

	static AProperties oInstance;
	return oInstance;
}

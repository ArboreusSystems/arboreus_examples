// ----------------------------------------------------------
/*!
	\class AProperties
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/07/2021 at 11:40:41
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

	_A_DEBUG << "AProperties created";
}


// -----------
/*!
	\fn

	Doc.
*/

AProperties::~AProperties(void) {

	ADir::mRemoveRecursively(this->mPathDataApplication());
	ADir::mRemoveRecursively(this->mPathDataCache());
	ADir::mRemoveRecursively(this->mPathDataConfig());

	_A_DEBUG << "AProperties deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AProperties::mInit(void) {

	pBackend = &ABackend::mInstance();

	this->mInitPaths();

	_A_DEBUG << "AProperties initiated";
	emit sgInitiated();
}


// -----------
/*!
	\fn

	Doc.
*/

const char* AProperties::mNameOrganisationChar(void) {

	return pNameOrganisation;
}


// -----------
/*!
	\fn

	Doc.
*/

const char* AProperties::mNameDomainChar(void) {

	return pNameDomain;
}


// -----------
/*!
	\fn

	Doc.
*/

const char* AProperties::mNameApplicationChar(void) {

	return pNameApplication;
}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mNameOrganisationString(void) {

	QString oOutput(pNameOrganisation);
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mNameDomainString(void) {

	QString oOutput(pNameDomain);
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mNameApplicationString(void) {

	QString oOutput(pNameApplication);
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mPathDataApplication(void) {

	return pPathDataApplication;
}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mPathDataConfig(void) {

	return pPathDataConfig;
}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mPathDataCache(void) {

	return pPathDataCache;
}


// -----------
/*!
	\fn

	Doc.
*/


void AProperties::mInitPaths(void) {

	pPathDataApplication = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) +
		"/" + this->mNameOrganisationString() + "/" + this->mNameApplicationString();
	if (ADir::mEnsure(pPathDataApplication)) {
		_A_DEBUG << "Ensured Application Data path:" << pPathDataApplication;
	} else {
		_A_CRITICAL << "No Application Data path:" << pPathDataApplication;
	}

	pPathDataConfig = QStandardPaths::writableLocation(QStandardPaths::GenericConfigLocation) +
		"/" + this->mNameOrganisationString() + "/" + this->mNameApplicationString();
	if (ADir::mEnsure(pPathDataConfig)) {
		_A_DEBUG << "Ensured Config Data path:" << pPathDataConfig;
	} else {
		_A_CRITICAL << "No Config Data path:" << pPathDataConfig;
	}

	pPathDataCache = QStandardPaths::writableLocation(QStandardPaths::GenericCacheLocation) +
		"/" + this->mNameOrganisationString() + "/" + this->mNameApplicationString();
	if (ADir::mEnsure(pPathDataCache)) {
		_A_DEBUG << "Ensured Cache Data path:" << pPathDataCache;
	} else {
		_A_CRITICAL << "No Cache Data path:" << pPathDataCache;
	}
}

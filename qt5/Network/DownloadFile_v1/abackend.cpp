// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/04/2021 at 12:21:50
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

ABackend::ABackend(QObject *parent) : QObject(parent) {

	ALOG << "ABackend created";
}


// -----------
/*!
	\fn

	Doc.
*/

ABackend::~ABackend(void) {

	ALOG << "ABackend deleted";
}


// -----------
/*!
	\fn

	Doc.
*/


ABackend& ABackend::mInstance(void) {

	static ABackend oInstance;
	return oInstance;
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mInit(void) {

	this->mInitProperties();
	this->mInitLogger();

	ALOG << "ABackend initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mInitProperties(void) {

	pProperties->mInit();
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mInitLogger(void) {

	pLogger->mInit();
}

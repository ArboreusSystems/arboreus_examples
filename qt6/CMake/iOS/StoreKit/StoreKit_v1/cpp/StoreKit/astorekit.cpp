// ----------------------------------------------------------
/*!
	\class AStoreKit
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/02/2023 at 15:55:01
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "astorekit.h"

// Forwared classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

AStoreKit::AStoreKit(QObject* parent) : AThreadTemplate<AStoreKitService>(new AStoreKitService, parent) {

	QObject::connect(
		this,&AStoreKit::sgInit,
		this->mService(),&AStoreKitService::slInit
	);
	QObject::connect(
		this->mService(),&AStoreKitService::sgInitiated,
		this,&AStoreKit::slInitiated
	);

	_A_DEBUG << "AStoreKit created";
}


// -----------
/*!
	\fn

	Doc.
*/

AStoreKit::~AStoreKit(void) {

	_A_DEBUG << "AStoreKit deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AStoreKit::mInit(void) {

	qRegisterMetaType<AStorekitConfigInterface>();

	pBackend = &ABackend::mInstance();

	AStorekitServiceProperties oProperties;
	oProperties.pConfig = pBackend->pGlobalConfig;

	pConfig = qobject_cast<AStorekitConfigInterface*>(oProperties.pConfig);

	emit this->sgInit(oProperties);
}


// -----------
/*!
	\fn

	Doc.
*/

void AStoreKit::slInitiated(void) {

	_A_DEBUG << "AStoreKit initiated";
	emit this->sgInitiated();
}


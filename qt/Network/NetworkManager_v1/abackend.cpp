// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/04/2021 at 16:34:49
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

	ALOG << "ABackend deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

ABackend::~ABackend(void) {

	ALOG << "ABackend created";
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

	AThreadObjectControllerTemplate oController;
	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgStartAction,
		pProperties,&AProperties::slInit
	);
	QObject::connect(
		pProperties,&AProperties::sgInitialised,
		pLogger,&ALogger::slInit
	);
	QObject::connect(
		pLogger,&ALogger::sgInitialised,
		pNetwork,&ANetwork::slInit
	);
	QObject::connect(
		pNetwork,&ANetwork::sgInitialised,
		[this](){

			ALOG << "ABackend initialised";

			this->mRegisterProperties();
			this->mRegisterLogger();
			this->mRegisterNetwork();

			emit this->sgReadyToUse();
		}
	);

	emit oController.sgStartAction();
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mRegisterProperties(void) {

	pRootContext->setContextProperty("AProperties",pProperties);

	ALOG << "AProperties registered";
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mRegisterLogger(void) {

	pRootContext->setContextProperty("ALogger",pLogger);

	ALOG << "ALogger registered";
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mRegisterNetwork(void) {

	pRootContext->setContextProperty("ANetwork",pNetwork);

	ALOG << "ANetwork registered";
}

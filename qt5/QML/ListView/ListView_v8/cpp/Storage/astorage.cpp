// ----------------------------------------------------------
/*!
	\class AStorage
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/07/2021 at 23:10:20
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "astorage.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

AStorage::AStorage(QObject* parent) : AThreadTemplate<AStorageService>(new AStorageService, parent) {

	_A_DEBUG << "AStorage created";
}


// -----------
/*!
	\fn

	Doc.
*/

AStorage::~AStorage(void) {

	_A_DEBUG << "AStorage deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AStorage::mInit(void) {

	pBackend = &ABackend::mInstance();

	QObject::connect(
		this,&AStorage::sgInit,
		this->mService(),&AStorageService::slInit
	);
	QObject::connect(
		this->mService(),&AStorageService::sgInitiated,
		this,&AStorage::slInitiated
	);

	emit sgInit(pBackend->pProperties->mPathDataApplication());
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantList AStorage::mGetAll(void) {

	QEventLoop oEventLoop;

	AThreadObjectControllerTemplate oController;
	ADBRequestAll oRequest(this->mService()->mGetDB());

	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgRun,
		&oRequest,&ADBRequestAll::slRun
	);
	QObject::connect(
		&oRequest,&ADBRequestAll::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	oRequest.moveToThread(this);

	emit oController.sgRun();
	oEventLoop.exec();

	return oRequest.pResult;
}


// -----------
/*!
	\fn

	Doc.
*/

void AStorage::mAdd(QString inColor, QString inText) {

	QEventLoop oEventLoop;

	AThreadObjectControllerTemplate oController;
	ADBRequestAdd oRequest(this->mService()->mGetDB());
	oRequest.pModel.Color = inColor;
	oRequest.pModel.Text = inText;

	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgRun,
		&oRequest,&ADBRequestAdd::slRun
	);
	QObject::connect(
		&oRequest,&ADBRequestAdd::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	oRequest.moveToThread(this);

	emit oController.sgRun();
	oEventLoop.exec();

	emit sgDataUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

void AStorage::slInitiated(void) {

	this->mAdd("red","Red");
	this->mAdd("forestgreen","Forestgreen");
	this->mAdd("blue","Blue");

	_A_DEBUG << "AStorage initiated";
	emit sgInitiated();
}

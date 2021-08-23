// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/07/2021 at 22:40:11
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

ABackend::ABackend(QObject* parent) : QObject(parent) {

	_A_DEBUG << "ABackend created";
}


// -----------
/*!
	\fn

	Doc.
*/

ABackend::~ABackend(void) {

	_A_DEBUG << "ABackend deleted";
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

void ABackend::mInit(
	QGuiApplication* inGuiApplication,
	QQmlApplicationEngine* inEngine,
	QQmlContext* inRootContext
) {

	pGuiApplication = inGuiApplication;
	pEngine = inEngine;
	pRootContext = inRootContext;

	pProperties = new AProperties(pEngine);
	pStorage = new AStorage(pEngine);

	QObject::connect(
		pProperties,&AProperties::sgInitiated,
		this,[this](){
			this->mInitStorage();
		}
	);
	QObject::connect(
		pStorage,&AStorage::sgInitiated,
		this,&ABackend::slInitiated
	);

	this->mInitProperties();
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mInitQMLTypes(void) {

	qmlRegisterType<AListViewModel>("Arboreus",1,0,"AListViewModel");
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mInitProperties(void) {

	pProperties->mInit();
	pRootContext->setContextProperty("AProperties",pProperties);
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mInitStorage(void) {

	pStorage->mInit();
	pRootContext->setContextProperty("AStorage",pStorage);
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::slInitiated(void) {

	this->mInitQMLTypes();

	_A_DEBUG << "ABackend initiated";
	emit sgInitiated();
}

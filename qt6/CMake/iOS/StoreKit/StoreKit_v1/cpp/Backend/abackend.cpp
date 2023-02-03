// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/10/2022 at 12:19:52
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

ABackend &ABackend::mInstance(void) {

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
	QQmlContext* inRootContext,
	QObject* inGlobalConfig
) {

	pGlobalConfig = inGlobalConfig;
	pGuiApplication = inGuiApplication;
	pEngine = inEngine;
	pRootContext = inRootContext;

	pStoreKit = new AStoreKit(pEngine);
	QObject::connect(
		pStoreKit,&AStoreKit::sgInitiated,
		this,[this](){
			_A_DEBUG << "ABackend initiated";
			emit this->sgInitiated();
		}
	);

	pStoreKit->mInit();
}

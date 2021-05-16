// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 05/04/2021 at 20:19:51
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

ABackend &ABackend::mInstance() {

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
	QObject* inConfig
) {

	pGuiApplication = inGuiApplication;
	pEngine = inEngine;
	pRootContext = inRootContext;
	pConfig = inConfig;

	pLogger = new ALogger(pEngine);
	pLogger->mInit();

	ALOG << "ABackend initiated";
}

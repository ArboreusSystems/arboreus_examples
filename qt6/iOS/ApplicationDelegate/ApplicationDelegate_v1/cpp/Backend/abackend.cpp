// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 11:14:11
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

ABackend& ABackend::mInstance() {

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
	QQmlApplicationEngine* inQmlApplicationEngine,
	QQmlContext* inRootContext
) {

	if (inGuiApplication) this->pGuiApplication = inGuiApplication;
	if (inQmlApplicationEngine) this->pQmlApplicationEngine = inQmlApplicationEngine;
	if (inRootContext) this->pRootContext = inRootContext;

	pLogger = new ALogger(pQmlApplicationEngine);
	pApplication = new AApplication(pQmlApplicationEngine);

	QObject::connect(
		pLogger,&ALogger::sgInitiated,
		this,[this](){
			this->mInitApplication();
		}
	);
	QObject::connect(
		pApplication,&AApplication::sgInitiated,
		this,[this](){
			_A_DEBUG << "ABackend services initiated";
			emit this->sgInitiated();
		}
	);

	this->mInitLogger();
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mInitLogger(void) {

	pLogger->mInit();
	pRootContext->setContextProperty("ALogger",pLogger);
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mInitApplication(void) {

	pApplication->mInit();
	pRootContext->setContextProperty("AApplication",pApplication);
}

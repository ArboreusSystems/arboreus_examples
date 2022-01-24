// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/01/2022 at 09:06:52
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
	QGuiApplication* inApplication,
	QQmlApplicationEngine* inQmlApplicationEngine,
	QQmlContext* inRootContext
) {

	if (inApplication) this->pApplication = inApplication;
	if (inQmlApplicationEngine) this->pQmlApplicationEngine = inQmlApplicationEngine;
	if (inRootContext) this->pRootContext = inRootContext;

	pSMTP = new ASMTP(pQmlApplicationEngine);

	QObject::connect(
		pSMTP,&ASMTP::sgInitiated,
		this,[this](){
			_A_DEBUG << "ABackend initiated";
			emit this->sgInitiated();
		}
	);

	this->mInitSMTP();
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mInitSMTP(void) {

	pSMTP->mInit();
}

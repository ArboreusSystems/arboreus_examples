// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/08/2025 at 08:58:52
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

ABackend::ABackend(QObject* parent) : QObject{parent} {

	pJSObject = new AJSObject(this);
	pJSObjectLibrary1 = new ALibrary1_v1(this);
	pJSObjectLibrary2 = new ALibrary2_v1(this);

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

	pGuiApplication = inGuiApplication,
	pEngine = inEngine;
	pRootContext = inRootContext;

	pRootContext->setContextProperty("AJSObject",pJSObject);
	pRootContext->setContextProperty("AJSObjectLibrary1",pJSObjectLibrary1);
	pRootContext->setContextProperty("AJSObjectLibrary2",pJSObjectLibrary2);

	_A_DEBUG << "ABackend initiated";
}


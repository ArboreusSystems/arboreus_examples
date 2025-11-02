// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/08/2025 at 23:06:20
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

#ifdef Q_OS_ANDROID

	pJavaWrapper1 = new AJavaWrapper1(this);
	pJavaWrapper2 = new AJavaWrapper2(this);

#endif

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

#ifdef Q_OS_ANDROID

	pRootContext->setContextProperty("AJavaClass1",pJavaWrapper1);
	pRootContext->setContextProperty("AJavaClass2",pJavaWrapper2);

#endif

	_A_DEBUG << "ABackend initiated";
}

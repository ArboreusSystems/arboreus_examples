// ----------------------------------------------------------
/*!
	\class AService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 12:28:35
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aservice.h"


// -----------
/*!
	\fn

	Doc.
*/

AService::AService(QObject* parent) : QObject(parent) {

	pMutex.lock();
}


// -----------
/*!
	\fn

	Doc.
*/

AService::~AService(void) {

	pWaitCondition.wakeAll();
	pMutex.unlock();
}


// -----------
/*!
	\fn

	Doc.
*/

void AService::mResume(void) {

	pWaitCondition.wakeAll();
}


// -----------
/*!
	\fn

	Doc.
*/

void AService::mSuspend(void) {

	QMetaObject::invokeMethod(this,&AService::slSuspend);
	pMutex.lock();
	pMutex.unlock();
}


// -----------
/*!
	\fn

	Doc.
*/

void AService::slSuspend(void) {

	pWaitCondition.wait(&pMutex);
}

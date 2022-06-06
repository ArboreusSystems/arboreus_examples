// ----------------------------------------------------------
/*!
	\class AApplication
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 11:33:24
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplication.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

AApplication::AApplication(QObject* parent) : AThreadTemplate<AApplicationService>(new AApplicationService, parent) {

	this->setPriority(QThread::Priority::LowestPriority);

	QObject::connect(
		this,&AApplication::sgInit,
		this->mService(),&AApplicationService::slInit
	);
	QObject::connect(
		this->mService(),&AApplicationService::sgInitiated,
		this,&AApplication::slInitiated
	);

	_A_DEBUG << "AApplication created";
}


// -----------
/*!
	\fn

	Doc.
*/

AApplication::~AApplication(void) {

	_A_DEBUG << "AApplication deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mInit(void) {

	pBackend = &ABackend::mInstance();

#if defined(Q_OS_IOS)
	pDelegate = qobject_cast<AApplicationIOSDelegate*>(
		new AApplicationIOSDelegate(this)
	);
#elif defined(Q_OS_ANDROID)
	pDelegate = qobject_cast<AApplicationAndroidDelegate*>(
		new AApplicationAndroidDelegate(this)
	);
#else

#endif

	emit this->sgInit();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::slInitiated(void) {

	_A_DEBUG << "AApplication initiated";

	emit this->sgInitiated();
}

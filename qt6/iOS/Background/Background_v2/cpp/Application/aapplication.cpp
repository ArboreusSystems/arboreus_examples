// ----------------------------------------------------------
/*!
	\class AApplication
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/05/2022 at 15:49:30
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplication.h"

// Forwarded classes
#include "abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

AApplication::AApplication(QObject* parent) : AThreadTemplate<AApplicationService>(new AApplicationService, parent) {

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

#ifdef Q_OS_IOS
	fApplicationIOSDelegateInit();
#endif

	pBackend = &ABackend::mInstance();

	this->setPriority(QThread::LowPriority);
	this->start();

	emit this->sgInit();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mOnWillQuit(void) {

	_A_DEBUG << "mOnWillQuit";

	emit this->sgOnWillQuit();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mOnDidBecomeActive(void) {

	_A_DEBUG << "mOnDidBecomeActive";

	emit this->sgOnDidBecomeActive();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mOnDidFinishLaunchWithOptions(void) {

	_A_DEBUG << "mOnDidFinishLaunchWithOptions";

	emit this->sgOnDidFinishLaunchWithOptions();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mOnDidEnterBackground(void) {

	_A_DEBUG << "mOnDidEnterBackground";

	emit this->sgOnDidEnterBackground();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mOnWillEnterBackground(void) {

	_A_DEBUG << "mOnWillEnterBackground";

	emit this->sgOnWillEnterBackground();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mOnDidEnterForeground(void) {

	_A_DEBUG << "mOnDidEnterForeground";

	emit this->sgOnDidEnterForeground();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mOnWillEnterForeground(void) {

	_A_DEBUG << "mOnWillEnterForeground";

	emit this->sgOnWillEnterForeground();
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

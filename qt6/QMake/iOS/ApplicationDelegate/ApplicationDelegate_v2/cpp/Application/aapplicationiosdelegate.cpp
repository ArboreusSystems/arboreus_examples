// ----------------------------------------------------------
/*!
	\class AApplicationIOSDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 13:42:47
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplicationiosdelegate.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

AApplicationIOSDelegate::AApplicationIOSDelegate(QObject* parent) : AApplicationDelegate(parent) {

	pBackend = &ABackend::mInstance();
	fApplicationNativeIOSDelegateInit();

	_A_DEBUG << "AApplicationIOSDelegate created";
}


// -----------
/*!
	\fn

	Doc.
*/

AApplicationIOSDelegate::~AApplicationIOSDelegate(void) {

	_A_DEBUG << "AApplicationIOSDelegate AApplicationIOSDelegate";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnQuit(void) {

//	_A_DEBUG << "AApplicationIOSDelegate mOnQuit";
	pBackend->pApplication->mOnQuit();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnLaunchFinished(void) {

//	_A_DEBUG << "AApplicationIOSDelegate mOnLaunchFinished";
	pBackend->pApplication->mOnLaunchFinished();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnDidBecomeActive(void) {

//	_A_DEBUG << "DELEGATE AApplicationIOSDelegate mOnDidBecomeActive";
	emit this->sgOnStateChanged(Qt::ApplicationState::ApplicationActive);
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnWillTerminate(void) {

//	_A_DEBUG << "DELEGATE AApplicationIOSDelegate mOnWillTerminate";
	this->mOnQuit();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnDidFinishLaunchingWithOptions(void) {

//	_A_DEBUG << "DELEGATE AApplicationIOSDelegate mOnDidFinishLaunchingWithOptions";
	this->mOnLaunchFinished();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnWillResignActive(void) {

//	_A_DEBUG << "DELEGATE AApplicationIOSDelegate mOnWillResignActive";
	emit this->sgOnStateChanged(Qt::ApplicationState::ApplicationInactive);
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnDidEnterBackground(void) {

//	_A_DEBUG << "DELEGATE AApplicationIOSDelegate mOnDidEnterBackground";
	emit this->sgOnStateChanged(Qt::ApplicationState::ApplicationSuspended);
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnWillEnterForeground(void) {

	_A_DEBUG << "DELEGATE AApplicationIOSDelegate mOnWillEnterForeground";
}


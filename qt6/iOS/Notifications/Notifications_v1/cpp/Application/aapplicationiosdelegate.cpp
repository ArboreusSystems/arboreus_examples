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


// -----------
/*!
	\fn

	Doc.
*/

AApplicationIOSDelegate::AApplicationIOSDelegate(QObject* parent) : QObject(parent) {

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

void AApplicationIOSDelegate::mOnDidBecomeActive(void) {

//	fNotificationsAskPermissions();

	_A_DEBUG << "AApplicationIOSDelegate mOnDidBecomeActive";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnWillTerminate(void) {

	_A_DEBUG << "AApplicationIOSDelegate mOnWillTerminate";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnDidFinishLaunchingWithOptions(void) {

	_A_DEBUG << "AApplicationIOSDelegate mOnDidFinishLaunchingWithOptions";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnWillResignActive(void) {

	_A_DEBUG << "AApplicationIOSDelegate mOnWillResignActive";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnDidEnterBackground(void) {

	_A_DEBUG << "AApplicationIOSDelegate mOnDidEnterBackground";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationIOSDelegate::mOnWillEnterForeground(void) {

	_A_DEBUG << "AApplicationIOSDelegate mOnWillEnterForeground";
}


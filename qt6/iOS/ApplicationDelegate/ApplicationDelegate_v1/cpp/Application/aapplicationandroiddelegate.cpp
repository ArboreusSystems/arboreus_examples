// ----------------------------------------------------------
/*!
	\class AApplicationAndroidDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 13:43:20
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplicationandroiddelegate.h"


// -----------
/*!
	\fn

	Doc.
*/

AApplicationAndroidDelegate::AApplicationAndroidDelegate(QObject* parent) : QObject(parent) {

	_A_DEBUG << "AApplicationAndroidDelegate created";
}


// -----------
/*!
	\fn

	Doc.
*/

AApplicationAndroidDelegate::~AApplicationAndroidDelegate(void) {

	_A_DEBUG << "AApplicationAndroidDelegate deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationAndroidDelegate::mOnDidBecomeActive(void) {

	_A_DEBUG << "AApplicationAndroidDelegate mOnDidBecomeActive";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationAndroidDelegate::mOnWillTerminate(void) {

	_A_DEBUG << "AApplicationAndroidDelegate mOnWillTerminate";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationAndroidDelegate::mOnDidFinishLaunchingWithOptions(void) {

	_A_DEBUG << "AApplicationAndroidDelegate mOnDidFinishLaunchingWithOptions";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationAndroidDelegate::mOnWillResignActive(void) {

	_A_DEBUG << "AApplicationAndroidDelegate mOnWillResignActive";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationAndroidDelegate::mOnDidEnterBackground(void) {

	_A_DEBUG << "AApplicationAndroidDelegate mOnDidEnterBackground";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationAndroidDelegate::mOnWillEnterForeground(void) {

	_A_DEBUG << "AApplicationAndroidDelegate mOnWillEnterForeground";
}


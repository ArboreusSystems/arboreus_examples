// ----------------------------------------------------------
/*!
	\class AConfig
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/10/2022 at 12:42:07
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aconfig.h"

// Forwarded classes
#include <abackend.h>



// -----------
/*!
	\fn

	Doc.
*/

void fAApplicationConfig_Delegate_WillFinishLaunchingWithOptions(void) {

	_A_DEBUG << "fAApplicationConfig_Delegate_WillFinishLaunchingWithOptions";
}


// -----------
/*!
	\fn

	Doc.
*/

void fAApplicationConfig_Delegate_DidFinishLaunchingWithOptions(void) {

	_A_DEBUG << "fAApplicationConfig_Delegate_DidFinishLaunchingWithOptions";
}


// -----------
/*!
	\fn

	Doc.
*/

AConfig::AConfig(QObject* parent) : QObject(parent) {

	_A_DEBUG << "AConfig created";
}


// -----------
/*!
	\fn

	Doc.
*/

AConfig::~AConfig(void) {

	_A_DEBUG << "AConfig deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::mSetBackend(ABackend* inBackend) {

	pBackend = inBackend;
}


// -----------
/*!
	\fn

	Doc.
*/

QThread::Priority AConfig::AApplicationConfig_Application_ThreadPriority(void) {

	return pAApplicationConfig_Application_ThreadPriority;
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Lifecycle_WillLaunchBackend(void) {

	_A_DEBUG << "AApplicationConfig_Lifecycle_WillLaunchBackend";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Lifecycle_DidLaunchBackend(void) {

	_A_DEBUG << "AApplicationConfig_Lifecycle_DidLaunchBackend";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Lifecycle_WillLaunchUI(void) {

	_A_DEBUG << "AApplicationConfig_Lifecycle_WillLaunchUI";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Lifecycle_DidLaunchUI(void) {

	_A_DEBUG << "AApplicationConfig_Lifecycle_DidLaunchUI";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Lifecycle_WillQuit(void) {

	_A_DEBUG << "AApplicationConfig_Lifecycle_WillQuit";
}


#if defined(Q_OS_IOS)

// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Delegate_DidBecomeActive(void) {

	_A_DEBUG << "AApplicationConfig_DidBecomeActive";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Delegate_WillResignActive(void) {

	_A_DEBUG << "AApplicationConfig_WillResignActive";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Delegate_DidReceiveMemoryWarning(void) {

	_A_DEBUG << "AApplicationConfig_DidReceiveMemoryWarning";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Delegate_WillTerminate(void) {

	_A_DEBUG << "AApplicationConfig_WillTerminate";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Delegate_SignificantTimeChange(void) {

	_A_DEBUG << "AApplicationConfig_SignificantTimeChange";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Delegate_DidRegisterForRemoteNotificationsWithDeviceToken(QByteArray inToken) {

	Q_UNUSED(inToken)

	_A_DEBUG << "AApplicationConfig_DidRegisterForRemoteNotificationsWithDeviceToken";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Delegate_DidFailToRegisterForRemoteNotificationsWithError(void) {

	_A_DEBUG << "AApplicationConfig_DidFailToRegisterForRemoteNotificationsWithError";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Delegate_DidUpdateUserActivity(void) {

	_A_DEBUG << "AApplicationConfig_DidUpdateUserActivity";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Delegate_DidEnterBackground(void) {

	_A_DEBUG << "AApplicationConfig_DidEnterBackground";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_Delegate_WillEnterForeground(void) {

	_A_DEBUG << "AApplicationConfig_WillEnterForeground";
}

#endif

// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/10/2022 at 13:08:42
	\endlist
*/
// ----------------------------------------------------------
#ifndef AAPPLICATIONCONFIG_H
#define AAPPLICATIONCONFIG_H

// System includes

// Precompiled includes
#include <aapplicationpch.h>

// Application includes

// Constants and defintions

// Namespace

class AApplicationConfig {

	public:


		// ------------------------
		// Application

		virtual QThread::Priority AApplicationConfig_Application_ThreadPriority(void) = 0;


		// ------------------------
		// Lifecycle

		virtual void AApplicationConfig_Lifecycle_WillLaunchBackend(void) = 0;
		virtual void AApplicationConfig_Lifecycle_DidLaunchBackend(void) = 0;
		virtual void AApplicationConfig_Lifecycle_WillLaunchUI(void) = 0;
		virtual void AApplicationConfig_Lifecycle_DidLaunchUI(void) = 0;
		virtual void AApplicationConfig_Lifecycle_WillQuit(void) = 0;


		// ------------------------
		// Delegate

#if defined(Q_OS_IOS)
		virtual void AApplicationConfig_Delegate_DidBecomeActive(void) = 0;
		virtual void AApplicationConfig_Delegate_WillResignActive(void) = 0;
		virtual void AApplicationConfig_Delegate_DidReceiveMemoryWarning(void) = 0;
		virtual void AApplicationConfig_Delegate_WillTerminate(void) = 0;
		virtual void AApplicationConfig_Delegate_SignificantTimeChange(void) = 0;
		virtual void AApplicationConfig_Delegate_DidRegisterForRemoteNotificationsWithDeviceToken(QByteArray inToken) = 0;
		virtual void AApplicationConfig_Delegate_DidFailToRegisterForRemoteNotificationsWithError(void) = 0;
		virtual void AApplicationConfig_Delegate_DidUpdateUserActivity(void) = 0;
		virtual void AApplicationConfig_Delegate_DidEnterBackground(void) = 0;
		virtual void AApplicationConfig_Delegate_WillEnterForeground(void) = 0;
#endif
};

Q_DECLARE_INTERFACE(AApplicationConfig,"Arboreus.AApplicationConfig/1.0")

#endif // AAPPLICATIONCONFIG_H

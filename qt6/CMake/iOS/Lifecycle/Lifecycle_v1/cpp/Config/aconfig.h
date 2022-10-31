// ----------------------------------------------------------
/*!
	\headerfile AConfig
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/10/2022 at 12:42:07
	\endlist
*/
// ----------------------------------------------------------

#ifndef ACONFIG_H
#define ACONFIG_H

// System includes

// Precompiled includes
#include <aconfigpch.h>

// Application includes
#include <aloggerglobal.h>
#include <aconfigglobal.h>
#include <aapplicationconfig.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class AConfig :
	public QObject,
	public AApplicationConfig {

	Q_OBJECT
	Q_INTERFACES(
		AApplicationConfig
	)

	public:

		explicit AConfig(QObject* parent = nullptr);
		virtual ~AConfig(void);

		void mSetBackend(ABackend* inBackend);

	private:

		ABackend* pBackend = nullptr;


	// ----------------------------
	// AApplicationConfig

	public:

		QThread::Priority AApplicationConfig_Application_ThreadPriority(void);

		void AApplicationConfig_Lifecycle_WillLaunchBackend(void);
		void AApplicationConfig_Lifecycle_DidLaunchBackend(void);
		void AApplicationConfig_Lifecycle_WillLaunchUI(void);
		void AApplicationConfig_Lifecycle_DidLaunchUI(void);
		void AApplicationConfig_Lifecycle_WillQuit(void);

#if defined(Q_OS_IOS)
		void AApplicationConfig_Delegate_DidBecomeActive(void);
		void AApplicationConfig_Delegate_WillResignActive(void);
		void AApplicationConfig_Delegate_DidReceiveMemoryWarning(void);
		void AApplicationConfig_Delegate_WillTerminate(void);
		void AApplicationConfig_Delegate_SignificantTimeChange(void);
		void AApplicationConfig_Delegate_DidRegisterForRemoteNotificationsWithDeviceToken(QByteArray inToken);
		void AApplicationConfig_Delegate_DidFailToRegisterForRemoteNotificationsWithError(void);
		void AApplicationConfig_Delegate_DidUpdateUserActivity(void);
		void AApplicationConfig_Delegate_DidEnterBackground(void);
		void AApplicationConfig_Delegate_WillEnterForeground(void);
#endif

	private:

		QThread::Priority pAApplicationConfig_Application_ThreadPriority = QThread::Priority::LowPriority;
};

#endif // ACONFIG_H

// ----------------------------------------------------------
/*!
    \class AApplicationDelegateIOSNative
    \title
    \brief Template file classes/cpp/file.cpp

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 29/10/2022 at 14:13:24
    \endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplicationdelegateiosnative.h"


// Class global properties
static ABackend* gBackend = &ABackend::mInstance();

// Constants and definitons
#define _A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG qobject_cast<AApplicationConfig*>(gBackend->pGlobalConfig)

// Class category
@interface QIOSApplicationDelegate (AApplicationDelegateIOSNative)

@end


// Class definition
@implementation QIOSApplicationDelegate (AApplicationDelegateIOSNative)

// ----------------------------------
#pragma mark UIApplicationDelegate


-(BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {

	#pragma unused(application)
	#pragma unused(launchOptions)

	fAApplicationConfig_Delegate_WillFinishLaunchingWithOptions();

	return YES;
}

-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	#pragma unused(application)
	#pragma unused(launchOptions)

	fAApplicationConfig_Delegate_DidFinishLaunchingWithOptions();

	return YES;
}

-(void) applicationDidBecomeActive:(UIApplication*) application {

	#pragma unused(application)

	_A_DEBUG << "111111111111";

	_A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG->AApplicationConfig_Delegate_DidBecomeActive();
}

-(void) applicationWillResignActive:(UIApplication*) application {

	#pragma unused(application)

	_A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG->AApplicationConfig_Delegate_WillResignActive();
}

//-(BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

//	_A_DEBUG << "IOS NATIVE DELEGATE" << "openURL";

//	return YES;
//}

-(void) applicationDidReceiveMemoryWarning:(UIApplication*)application {

	#pragma unused(application)

	_A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG->AApplicationConfig_Delegate_DidReceiveMemoryWarning();
}

-(void) applicationWillTerminate:(UIApplication*)application {

	#pragma unused(application)

	_A_DEBUG << "222222222";

	_A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG->AApplicationConfig_Delegate_WillTerminate();
}

-(void) applicationSignificantTimeChange:(UIApplication*)application {

	#pragma unused(application)

	_A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG->AApplicationConfig_Delegate_SignificantTimeChange();
}

-(void) application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {

	#pragma unused(application)

	QByteArray oData = QByteArray::fromNSData(deviceToken);
	_A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG->AApplicationConfig_Delegate_DidRegisterForRemoteNotificationsWithDeviceToken(oData);
}

-(void) application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error {

	#pragma unused(application)
	#pragma unused(error)

	_A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG->AApplicationConfig_Delegate_DidFailToRegisterForRemoteNotificationsWithError();
}

//-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//
//	NSLog(@"didReceiveRemoteNotification");
//}

-(void) application:(UIApplication*)application didUpdateUserActivity:(NSUserActivity*)userActivity {

	#pragma unused(application)
	#pragma unused(userActivity)

	_A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG->AApplicationConfig_Delegate_DidUpdateUserActivity();
}

-(void) applicationDidEnterBackground:(UIApplication*)application {

	#pragma unused(application)

	_A_DEBUG << "44444444444444";

	_A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG->AApplicationConfig_Delegate_DidEnterBackground();
}

-(void) applicationWillEnterForeground:(UIApplication*)application {

	#pragma unused(application)

	_A_DEBUG << "3333333333333";

	_A_APPLICATION_DELEGATE_IOS_NATIVE_CONFIG->AApplicationConfig_Delegate_WillEnterForeground();
}

@end

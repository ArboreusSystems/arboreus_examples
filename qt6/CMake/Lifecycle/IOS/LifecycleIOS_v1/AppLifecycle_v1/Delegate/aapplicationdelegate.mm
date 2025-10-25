// ----------------------------------------------------------
/*!
	\class AApplicationDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/07/2022 at 17:41:09
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplicationdelegate.h"


@interface QIOSApplicationDelegate (AApplicationDelegate)

@end

@implementation QIOSApplicationDelegate (AApplicationDelegate)


// ----------------------------------
#pragma mark UIApplicationDelegate


-(void) applicationDidFinishLaunching:(UIApplication *)application {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "applicationDidFinishLaunching";
}

-(BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "willFinishLaunchingWithOptions";

	return YES;
}

-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	#pragma unused(application)

	_A_DEBUG << "IOS NATIVE DELEGATE" << "didFinishLaunchingWithOptions";

	if (launchOptions[UIApplicationLaunchOptionsBluetoothCentralsKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsBluetoothCentralsKey";
	} else if (launchOptions[UIApplicationLaunchOptionsBluetoothPeripheralsKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsBluetoothPeripheralsKey";
	} else if (launchOptions[UIApplicationLaunchOptionsCloudKitShareMetadataKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsCloudKitShareMetadataKey";
	} else if (launchOptions[UIApplicationLaunchOptionsLocationKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsLocationKey";
	} else if (launchOptions[UIApplicationLaunchOptionsNewsstandDownloadsKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsNewsstandDownloadsKey";
	} else if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsRemoteNotificationKey";
	} else if (launchOptions[UIApplicationLaunchOptionsShortcutItemKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsShortcutItemKey";
	} else if (launchOptions[UIApplicationLaunchOptionsSourceApplicationKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsSourceApplicationKey";
	} else if (launchOptions[UIApplicationLaunchOptionsURLKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsURLKey";
	} else if (launchOptions[UIApplicationLaunchOptionsUserActivityDictionaryKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsUserActivityDictionaryKey";
	} else if (launchOptions[UIApplicationLaunchOptionsUserActivityTypeKey]) {
		_A_DEBUG << "IOS NATIVE DELEGATE" << "UIApplicationLaunchOptionsUserActivityTypeKey";
	} else {
		if ([launchOptions count] == 0) {
			_A_DEBUG << "IOS NATIVE DELEGATE" << "No keys for launch";
		} else {
			_A_DEBUG << "IOS NATIVE DELEGATE" << "Undefined key in launch otions";
			_A_DEBUG << "IOS NATIVE DELEGATE" << "launchOptions count:" << (unsigned long)[launchOptions count];
		}
	}

	return YES;
}

-(void) applicationDidBecomeActive:(UIApplication*) application {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "applicationDidBecomeActive";
}

-(void) applicationWillResignActive:(UIApplication*) application {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "applicationWillResignActive";
}

//-(BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

//	_A_DEBUG << "IOS NATIVE DELEGATE" << "openURL";

//	return YES;
//}

-(void) applicationDidReceiveMemoryWarning:(UIApplication *)application {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "applicationDidReceiveMemoryWarning";
}

-(void) applicationWillTerminate:(UIApplication*) application {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "applicationWillTerminate";
}

-(void) applicationSignificantTimeChange:(UIApplication *)application {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "applicationSignificantTimeChange";
}

-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "didRegisterForRemoteNotificationsWithDeviceToken";
}

-(void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "didFailToRegisterForRemoteNotificationsWithError";
}

//-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//
//	NSLog(@"didReceiveRemoteNotification");
//}

-(void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "didUpdateUserActivity";
}

-(void) applicationDidEnterBackground:(UIApplication*) application {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "applicationDidEnterBackground";
}

-(void) applicationWillEnterForeground:(UIApplication*) application {

	_A_DEBUG << "IOS NATIVE DELEGATE" << "applicationWillEnterForeground";
}

@end

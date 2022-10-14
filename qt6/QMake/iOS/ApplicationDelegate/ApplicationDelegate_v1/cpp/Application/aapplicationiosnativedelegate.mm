// ----------------------------------------------------------
/*!
	\class AApplicationIOSNativeDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 14:10:22
	\endlist
*/
// ----------------------------------------------------------

// -----------
// IOS part
// -----------

// iOS Class header
#include "aapplicationiosnativedelegate.h"

// iOS Class
@implementation AApplicationIOSNativeDelegate

#pragma mark Instance

+(AApplicationIOSNativeDelegate*) mInstance {

	static dispatch_once_t oPredicate;
	static AApplicationIOSNativeDelegate* oSharedDelegate = nil;
	dispatch_once(&oPredicate, ^{
		oSharedDelegate = [[super alloc] init];
	});
	return oSharedDelegate;
}

#pragma mark Application delegate

-(void) applicationDidFinishLaunching:(UIApplication *)application {

	_A_DEBUG << "applicationDidFinishLaunching";
}

-(BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {

	_A_DEBUG << "willFinishLaunchingWithOptions";

	return YES;
}

-(BOOL) application:(UIApplication*) application didFinishLaunchingWithOptions:(NSDictionary*) launchOptions {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnDidFinishLaunchingWithOptions();

	[application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
	_A_DEBUG << "didFinishLaunchingWithOptions";

	return YES;
}

-(void) applicationDidBecomeActive:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnDidBecomeActive();

	_A_DEBUG << "applicationDidBecomeActive";
}

-(void) applicationWillResignActive:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnWillResignActive();

	_A_DEBUG << "applicationWillResignActive";
}

-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {

	_A_DEBUG << "handleOpenURL";

	return YES;
}

-(BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

	_A_DEBUG << "openURL";

	return YES;
}

-(void) applicationDidReceiveMemoryWarning:(UIApplication *)application {

	_A_DEBUG << "applicationDidReceiveMemoryWarning";
}

-(void) applicationWillTerminate:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnWillTerminate();

	_A_DEBUG << "applicationWillTerminate";
}

-(void) applicationSignificantTimeChange:(UIApplication *)application {

	_A_DEBUG << "applicationSignificantTimeChange";
}

-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

	_A_DEBUG << "didRegisterForRemoteNotificationsWithDeviceToken";
}

-(void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {

	_A_DEBUG << "didFailToRegisterForRemoteNotificationsWithError";
}

-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

	_A_DEBUG << "didReceiveRemoteNotification with fetchCompletionHandler";
}

-(void) application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

	_A_DEBUG << "performFetchWithCompletionHandler";
}

-(void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity {

	_A_DEBUG << "didFailToContinueUserActivityWithType";
}

-(void) applicationDidEnterBackground:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnDidEnterBackground();

	_A_DEBUG << "applicationDidEnterBackground";
}

-(void) applicationWillEnterForeground:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnWillEnterForeground();

	_A_DEBUG << "applicationWillEnterForeground";
}

@end


// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE

void fApplicationNativeIOSDelegateInit(void) {

	[[UIApplication sharedApplication] setDelegate:[AApplicationIOSNativeDelegate mInstance]];
	_A_DEBUG << "Application Native IOS Delegate initiated";
}

QT_END_NAMESPACE


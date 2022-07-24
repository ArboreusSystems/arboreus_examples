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

	_A_DEBUG << "IOS_NATIVE applicationDidFinishLaunching";
}

-(BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {

	_A_DEBUG << "IOS_NATIVE willFinishLaunchingWithOptions";

	return YES;
}

-(BOOL) application:(UIApplication*) application didFinishLaunchingWithOptions:(NSDictionary*) launchOptions {

	ABackend* oBackend = &ABackend::mInstance();
	AApplicationIOSDelegate* oDelegate = static_cast<AApplicationIOSDelegate*>(
		oBackend->pApplication->pDelegate
	);
	oDelegate->mOnDidFinishLaunchingWithOptions();

	_A_DEBUG << "IOS_NATIVE didFinishLaunchingWithOptions";

	return YES;
}

-(void) applicationDidBecomeActive:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	AApplicationIOSDelegate* oDelegate = static_cast<AApplicationIOSDelegate*>(
		oBackend->pApplication->pDelegate
	);
	oDelegate->mOnDidBecomeActive();

	_A_DEBUG << "IOS_NATIVE applicationDidBecomeActive";
}

-(void) applicationWillResignActive:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	AApplicationIOSDelegate* oDelegate = static_cast<AApplicationIOSDelegate*>(
		oBackend->pApplication->pDelegate
	);
	oDelegate->mOnWillResignActive();

	_A_DEBUG << "IOS_NATIVE applicationWillResignActive";
}

-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {

	_A_DEBUG << "IOS_NATIVE handleOpenURL";

	return YES;
}

-(BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

	_A_DEBUG << "IOS_NATIVE openURL";

	return YES;
}

-(void) applicationDidReceiveMemoryWarning:(UIApplication *)application {

	_A_DEBUG << "IOS_NATIVE applicationDidReceiveMemoryWarning";
}

-(void) applicationWillTerminate:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	AApplicationIOSDelegate* oDelegate = static_cast<AApplicationIOSDelegate*>(
		oBackend->pApplication->pDelegate
	);
	oDelegate->mOnWillTerminate();

	_A_DEBUG << "IOS_NATIVE applicationWillTerminate";
}

-(void) applicationSignificantTimeChange:(UIApplication *)application {

	_A_DEBUG << "IOS_NATIVE applicationSignificantTimeChange";
}

-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

	_A_DEBUG << "IOS_NATIVE didRegisterForRemoteNotificationsWithDeviceToken";
}

-(void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {

	_A_DEBUG << "IOS_NATIVE didFailToRegisterForRemoteNotificationsWithError";
}

-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

	_A_DEBUG << "IOS_NATIVE didReceiveRemoteNotification with fetchCompletionHandler";
}

-(void) application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

	_A_DEBUG << "IOS_NATIVE performFetchWithCompletionHandler";
}

-(void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity {

	_A_DEBUG << "IOS_NATIVE didFailToContinueUserActivityWithType";
}

-(void) applicationDidEnterBackground:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	AApplicationIOSDelegate* oDelegate = static_cast<AApplicationIOSDelegate*>(
		oBackend->pApplication->pDelegate
	);
	oDelegate->mOnDidEnterBackground();

	_A_DEBUG << "IOS_NATIVE applicationDidEnterBackground";
}

-(void) applicationWillEnterForeground:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	AApplicationIOSDelegate* oDelegate = static_cast<AApplicationIOSDelegate*>(
		oBackend->pApplication->pDelegate
	);
	oDelegate->mOnWillEnterForeground();

	_A_DEBUG << "IOS_NATIVE applicationWillEnterForeground";
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


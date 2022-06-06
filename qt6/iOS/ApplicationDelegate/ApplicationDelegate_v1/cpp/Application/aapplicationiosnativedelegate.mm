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

+(AApplicationIOSNativeDelegate*) mInstance {

	static dispatch_once_t oPredicate;
	static AApplicationIOSNativeDelegate* oSharedDelegate = nil;
	dispatch_once(&oPredicate, ^{
		oSharedDelegate = [[super alloc] init];
	});
	return oSharedDelegate;
}

-(void) applicationDidBecomeActive:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnDidBecomeActive();
}

-(void) applicationWillTerminate:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnWillTerminate();
}

-(BOOL) application:(UIApplication*) application didFinishLaunchingWithOptions:(NSDictionary*) launchOptions {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnDidFinishLaunchingWithOptions();

	[application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
	return YES;
}

-(void) applicationWillResignActive:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnWillResignActive();
}

-(void) applicationDidEnterBackground:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnDidEnterBackground();
}

-(void) applicationWillEnterForeground:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->pDelegate->mOnWillEnterForeground();
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


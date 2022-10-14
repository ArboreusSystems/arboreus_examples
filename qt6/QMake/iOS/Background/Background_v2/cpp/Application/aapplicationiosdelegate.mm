// ----------------------------------------------------------
/*!
	\class AApplicationIOSDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/05/2022 at 16:43:23
	\endlist
*/
// ----------------------------------------------------------

// Application includes
#include <abackend.h>

// -----------
// IOS part
// -----------

// iOS Class header
#include "aapplicationiosdelegate.h"

void fApplicationIOSDelegateInit(void) {

	_A_DEBUG << "Delegate: InitializeDelegate";
	[[UIApplication sharedApplication] setDelegate:[AApplicationIOSDelegate mInstance]];
}

@implementation AApplicationIOSDelegate

+(AApplicationIOSDelegate*) mInstance {

	static dispatch_once_t oPredicate;
	static AApplicationIOSDelegate* oSharedDelegate = nil;
	dispatch_once(&oPredicate, ^{
		oSharedDelegate = [[super alloc] init];
	});
	return oSharedDelegate;
}

-(void) applicationDidBecomeActive:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->mOnDidBecomeActive();
}

-(void) applicationWillTerminate:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->mOnWillQuit();
}

-(BOOL) application:(UIApplication*) application didFinishLaunchingWithOptions:(NSDictionary*) launchOptions {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->mOnDidFinishLaunchWithOptions();

	[application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
	return YES;
}

-(void) applicationWillResignActive:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->mOnWillEnterBackground();
}

-(void) applicationDidEnterBackground:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->mOnDidEnterBackground();
}

-(void) applicationWillEnterForeground:(UIApplication*) application {

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pApplication->mOnWillEnterForeground();
}

@end

// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE



QT_END_NAMESPACE


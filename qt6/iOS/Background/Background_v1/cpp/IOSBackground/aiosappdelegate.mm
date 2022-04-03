// ----------------------------------------------------------
/*!
	\class AppDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/04/2022 at 08:53:45
	\endlist
*/
// ----------------------------------------------------------

#include <aloggerglobal.h>

#import "aiosappdelegate.h"
#import "aiosappstate.h"


@implementation AIOSAppDelegate

static AIOSAppDelegate* pDelegate = nil;

+(AIOSAppDelegate*) mSharedAppDelegate {

    static dispatch_once_t oPredicate;
    static AIOSAppDelegate* oSharedDelegate = nil;
    dispatch_once(&oPredicate, ^{
        oSharedDelegate = [[super alloc] init];
	});
    return oSharedDelegate;
}

void fInitializeDelegate(void) {

    _A_DEBUG << "Delegate: InitializeDelegate";
    [[UIApplication sharedApplication] setDelegate:[AIOSAppDelegate mSharedAppDelegate]];
}

-(void) applicationDidBecomeActive:(UIApplication*) application {

    _A_DEBUG << "Delegate: applicationDidBecomeActive";
    AIOSAppState::mGetInstance()->mApplicationDidBecomeActive();
}

-(void) applicationWillTerminate:(UIApplication*) application {

    _A_DEBUG << "Delegate: applicationWillTerminate";
}

-(BOOL) application:(UIApplication*) application didFinishLaunchingWithOptions:(NSDictionary*) launchOptions {

    _A_DEBUG << "Delegate: didFinishLaunchingWithOptions";
	[application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
	return YES;
}

-(void) applicationWillResignActive:(UIApplication*) application {

    _A_DEBUG << "Delegate: applicationWillResignActive";
}

-(void) applicationDidEnterBackground:(UIApplication*) application {

    _A_DEBUG << "Delegate: applicationDidEnterBackground";
    AIOSAppState::mGetInstance()->mApplicationDidEnterBackGround();
}

-(void) applicationWillEnterForeground:(UIApplication*) application {

    _A_DEBUG << "Delegate: applicationWillEnterForeground";
    AIOSAppState::mGetInstance()->mApplicationDidEnterForeGround();
}

@end

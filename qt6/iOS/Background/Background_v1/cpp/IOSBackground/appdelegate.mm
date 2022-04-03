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

#import "appdelegate.h"
#import "iosappstate.h"


@implementation AppDelegate

static AppDelegate* appDelegate = nil;

+(AppDelegate*) sharedAppDelegate{
	static dispatch_once_t pred;
	static AppDelegate *shared = nil;
	dispatch_once(&pred, ^{
		shared = [[super alloc] init];
	});
	return shared;
}

void InitializeDelegate(void) {

    _A_DEBUG << "Delegate: InitializeDelegate";
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	[[UIApplication sharedApplication] setDelegate:[AppDelegate sharedAppDelegate]];
}

-(void) applicationDidBecomeActive:(UIApplication *)application {

    _A_DEBUG << "Delegate: applicationDidBecomeActive";
	IOSAppState::getInstance()->applicationDidBecomeActive();
}

-(void) applicationWillTerminate:(UIApplication*)application {

    _A_DEBUG << "Delegate: applicationWillTerminate";
}

-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {

    _A_DEBUG << "Delegate: didFinishLaunchingWithOptions";
	[application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
	return YES;
}

-(void) applicationWillResignActive:(UIApplication *)application {

    _A_DEBUG << "Delegate: applicationWillResignActive";
}

-(void) applicationDidEnterBackground:(UIApplication *)application {

    _A_DEBUG << "Delegate: applicationDidEnterBackground";
	IOSAppState::getInstance()->applicationDidEnterBackGround();
}

-(void) applicationWillEnterForeground:(UIApplication *)application {

    _A_DEBUG << "Delegate: applicationWillEnterForeground";
	IOSAppState::getInstance()->applicationDidEnterForeGround();
}

@end

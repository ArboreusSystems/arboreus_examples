//
//  AppDelegate.m
//  LocalNotifications_v2
//
//  Created by Alexandr Kirilov on 15.06.2022.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// ----------------------------------------
#pragma mark - AppDelegate

-(BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
	
	[self mRequestNotificationAuthorisation];
	[self setPNotifications:[ANotifications mInstance]];
	
	return YES;
}


// ----------------------------------------
#pragma mark - UISceneSession lifecycle

-(UISceneConfiguration*) application:(UIApplication*)application configurationForConnectingSceneSession:(UISceneSession*)connectingSceneSession options:(UISceneConnectionOptions*)options {

	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

-(void) application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {}


// ----------------------------------------
#pragma mark - Notifications

-(void) mRequestNotificationAuthorisation {
	
	UNUserNotificationCenter* oNotificationsCenter = [UNUserNotificationCenter currentNotificationCenter];
	UNAuthorizationOptions oOptions = (UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound);
	[oNotificationsCenter requestAuthorizationWithOptions:oOptions completionHandler:^(BOOL inGranted, NSError* _Nullable inError) {
		
		if (inGranted) NSLog(@"Notification permissions granted");
		if (inError) NSLog(@"Notification failed with error");
	}];
}


@end

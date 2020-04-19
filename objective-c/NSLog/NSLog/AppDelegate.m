//
//  AppDelegate.m
//  NSLog
//
//  Created by Alexandr Kirilov on 19/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	HandlerLogger* oLogger = [[HandlerLogger alloc] init];
	[oLogger mMessage];
	[oLogger mMessage:@"Test message" inFunction:__PRETTY_FUNCTION__ inLine:__LINE__];
	
	return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
	
	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {}


@end

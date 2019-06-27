//
//  AppDelegate.m
//  Subscription
//
//  Created by Alexandr Kirilov on 27/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [[SubscriptionViewController alloc] init];
	[self.window makeKeyAndVisible];
	
	return YES;
}

@end

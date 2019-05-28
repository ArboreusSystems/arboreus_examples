//
//  AppDelegate.m
//  ViewControllers
//
//  Created by Alexandr Kirilov on 28/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	self.window = [[UIWindow alloc]
		initWithFrame: [[UIScreen mainScreen] bounds]
	];
	UINavigationController *oNavigationControlller = [[UINavigationController alloc]
		initWithRootViewController:[[MainViewController alloc] init]
	];
	self.window.rootViewController = oNavigationControlller;
	[self.window makeKeyAndVisible];
	
	return YES;
}

@end

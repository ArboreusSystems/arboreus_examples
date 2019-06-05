//
//  AppDelegate.m
//  Camera
//
//  Created by Alexandr Kirilov on 05/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	[self createMainView];
	
	return YES;
}

-(void) createMainView {

	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	MainViewController *oMainView = [[MainViewController alloc] init];
	UINavigationController *oNavigation = [[UINavigationController alloc]
		initWithRootViewController:oMainView
	];
	self.window.rootViewController = oNavigation;
	[self.window makeKeyAndVisible];
}

@end

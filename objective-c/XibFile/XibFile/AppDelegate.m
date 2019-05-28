//
//  AppDelegate.m
//  XibFile
//
//  Created by Alexandr Kirilov on 28/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(BOOL) application: (UIApplication *)application didFinishLaunchingWithOptions: (NSDictionary *)launchOptions {
	
	[self mCreateView];
	return YES;
}

-(void) mCreateView {
	
	self.window = [[UIWindow alloc]
		initWithFrame: [[UIScreen mainScreen] bounds]
	];
	MainViewController *oViewController = [[MainViewController alloc]
		initWithNibName: @"MainViewController"
		bundle: nil
	];
	UINavigationController *oNavigationControlller = [[UINavigationController alloc]
		initWithRootViewController:oViewController
	];
	self.window.rootViewController = oNavigationControlller;
	[self.window makeKeyAndVisible];
}

@end

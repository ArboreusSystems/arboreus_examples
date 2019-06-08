//
//  AppDelegate.m
//  Gestures
//
//  Created by Alexandr Kirilov on 08/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	[self mCreateView];
	
	return YES;
}

-(void) mCreateView {
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [[GestureViewController alloc] init];
	[self.window makeKeyAndVisible];
}

@end

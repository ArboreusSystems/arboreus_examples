//
//  AppDelegate.m
//  iOS13Display
//
//  Created by Alexandr Kirilov on 08/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewControllers/VCMain.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [[VCMain alloc] init];
	[self.window makeKeyAndVisible];
	
	return YES;
}

@end

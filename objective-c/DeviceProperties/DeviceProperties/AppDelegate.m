//
//  AppDelegate.m
//  DeviceProperties
//
//  Created by Alexandr Kirilov on 01/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	switch ([[UIDevice currentDevice] userInterfaceIdiom]) {
		case UIUserInterfaceIdiomPad:
			NSLog(@"Pad");
			break;
		case UIUserInterfaceIdiomPhone:
			NSLog(@"Phone");
			break;
		default:
			NSLog(@"Undefined");
			break;
	}
	
	NSString* oUUIDString = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
	NSLog(@"UUID: %@",oUUIDString);
	
	return YES;
}

@end

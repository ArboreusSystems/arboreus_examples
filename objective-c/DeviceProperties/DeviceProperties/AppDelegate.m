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
	
	// User interface idion: phone or pad
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
	
	// Device UUID
	NSString* oUUIDString = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
	NSLog(@"UUID: %@",oUUIDString);
	
	// CPU Architeture type
	NSLog(@"UIDevice -> name: %@",[[UIDevice currentDevice] name]);
	NSLog(@"UIDevice -> systemName: %@",[[UIDevice currentDevice] systemName]);
	NSLog(@"UIDevice -> systemVersion: %@",[[UIDevice currentDevice] systemVersion]);
	NSLog(@"UIDevice -> model: %@",[[UIDevice currentDevice] model]);
	NSLog(@"UIDevice -> localizedModel: %@",[[UIDevice currentDevice] localizedModel]);

	struct utsname systemInfo;
	uname(&systemInfo);
	NSLog(@"systemInfo.machine: %@",[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]);
	NSLog(@"systemInfo.nodename: %@",[NSString stringWithCString:systemInfo.nodename encoding:NSUTF8StringEncoding]);
	NSLog(@"systemInfo.release: %@",[NSString stringWithCString:systemInfo.release encoding:NSUTF8StringEncoding]);
	NSLog(@"systemInfo.sysname: %@",[NSString stringWithCString:systemInfo.sysname encoding:NSUTF8StringEncoding]);
	NSLog(@"systemInfo.version: %@",[NSString stringWithCString:systemInfo.version encoding:NSUTF8StringEncoding]);
	
	// UIElements
	NSLog(@"Status bar height: %f",[[UIApplication sharedApplication] statusBarFrame].size.height);
	
	return YES;
}

@end

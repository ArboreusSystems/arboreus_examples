//
//  AppDelegate.m
//  GCD
//
//  Created by Alexandr Kirilov on 31/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	dispatch_async(dispatch_get_main_queue(),^{
		
		self.window = [[UIWindow alloc]
			initWithFrame: [[UIScreen mainScreen] bounds]
		];
		UINavigationController *oNavigationControlller = [[UINavigationController alloc]
			initWithRootViewController:[[ViewController alloc] init]
		];
		self.window.rootViewController = oNavigationControlller;
		[self.window makeKeyAndVisible];
		
		for (int i = 0; i < 200; i++) NSLog(@"main_queue: %i",i);
	});
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), ^{
		for (int i = 0; i < 200; i++) NSLog(@"DISPATCH_QUEUE_PRIORITY_BACKGROUND: %i",i);
	});
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0), ^{
		for (int i = 0; i < 200; i++) NSLog(@"DISPATCH_QUEUE_PRIORITY_DEFAULT: %i",i);
	});
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW,0), ^{
		for (int i = 0; i < 200; i++) NSLog(@"DISPATCH_QUEUE_PRIORITY_LOW: %i",i);
	});
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0), ^{
		for (int i = 0; i < 200; i++) NSLog(@"DISPATCH_QUEUE_PRIORITY_HIGH: %i",i);
	});
	
	dispatch_queue_t vQueueSerial = dispatch_queue_create("com.arboreus.examples.gcd",NULL);
	dispatch_async(vQueueSerial, ^{
			for (int i = 0; i < 200; i++) NSLog(@"vQueueSerial: %i",i);
	});
	
	static dispatch_once_t vOnce;
	dispatch_once(&vOnce, ^{
		for (int i = 0; i < 200; i++) NSLog(@"dispatch_once: %i",i);
	});

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		for (int i = 0; i < 200; i++) NSLog(@"dispatch_after: %i",i);
	});

	dispatch_apply(5,vQueueSerial,^(size_t vIndex){
		for (int i = 0; i < 50; i++) NSLog(@"dispatch_apply: %i, Index: %zu",i,vIndex);
	});
	
	return YES;
}

@end

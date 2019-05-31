//
//  AppDelegate.m
//  Threads
//
//  Created by Alexandr Kirilov on 30/05/2019.
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
		initWithRootViewController:[[ApplicationViewController alloc] init]
	];
	self.window.rootViewController = oNavigationControlller;
	[self.window makeKeyAndVisible];
	
	self.backgroundThread01 = [[NSThread alloc]
		initWithTarget:self
		selector:@selector(mBackgroundThread01)
		object:nil
	];
	self.backgroundThread01.name = @"BackgroundThread01";
	
	self.backgroundThread02 = [[NSThread alloc]
		initWithTarget:self
		selector:@selector(mBackgroundThread02)
		object:nil
	];
	self.backgroundThread02.name = @"BackgroundThread02";
	
	[self.backgroundThread01 start];
	[self.backgroundThread02 start];
	
	return YES;
}

-(void) mBackgroundThread01 {
	
	@autoreleasepool {
		NSLog(@"Background Thread started");
		@synchronized (self) {
			for (int i = 0; i < 100; i++) {
				NSLog(@"From %@: %i",[[NSThread currentThread] name],i);
			}
		}
		NSLog(@"Background Thread stopped");
	}
}

-(void) mBackgroundThread02 {
	
	@autoreleasepool {
		NSLog(@"Background Thread started");
		@synchronized (self) {
			for (int i = 0; i < 100; i++) {
				NSLog(@"From %@: %i",[[NSThread currentThread] name],i);
			}
		}
		NSLog(@"Background Thread stopped");
	}
}

@end

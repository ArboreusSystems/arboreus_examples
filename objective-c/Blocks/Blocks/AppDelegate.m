//
//  AppDelegate.m
//  Blocks
//
//  Created by Alexandr Kirilov on 31/05/2019.
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
		initWithRootViewController:[[ViewController alloc] init]
	];
	self.window.rootViewController = oNavigationControlller;
	[self.window makeKeyAndVisible];
	
	void (^bMessageFromBlock)(void) = ^{
		NSLog(@"Message from block");
	};
	bMessageFromBlock();
	
	NSString *(^bReturnStringFromBlock)(NSString *) = ^(NSString *inValue){
		return inValue;
	};
	NSLog(@"%@",bReturnStringFromBlock(@"Message return from block"));
	
	__block NSInteger vSumm = 0;
	
	void (^bCalculateValueByBlock)(void) = ^{
		NSInteger vNumber = arc4random() % 10;
		vSumm = vSumm + vNumber;
		NSLog(@"Current value: %li",vNumber);
	};
	for (int i = 0; i < 10; i++) {
		bCalculateValueByBlock();
	}
	NSLog(@"The summ of values: %li",vSumm);
	
	vSumm = 0;
	BlockType bTypedBlock = ^{
		NSInteger vNumber = arc4random() % 10;
		vSumm = vSumm + vNumber;
		NSLog(@"Current value: %li",vNumber);
	};
	for (int i = 0; i < 10; i++) {
		bTypedBlock();
	}
	NSLog(@"The summ of values: %li",vSumm);
	
	vSumm = 0;
	for (int i = 0; i < 10; i++) {
		[self mBlockedMethodPure: bCalculateValueByBlock];
	}
	NSLog(@"mBlockedMethodPure: The summ of values: %li",vSumm);
	
	vSumm = 0;
	for (int i = 0; i < 10; i++) {
		[self mBlockedMethodTyped: bTypedBlock];
	}
	NSLog(@"mBlockedMethodTyped: The summ of values: %li",vSumm);
	
	return YES;
}

-(void) mBlockedMethodPure: (void(^)(void)) inBlock {
	inBlock();
}

-(void) mBlockedMethodTyped: (BlockType) inBlock {
	inBlock();
}

@end

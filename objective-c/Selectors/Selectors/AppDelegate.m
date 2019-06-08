//
//  AppDelegate.m
//  Selectors
//
//  Created by Alexandr Kirilov on 08/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AppDelegate.h"
#define __METHOD_NAME_TO_LOG NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	[self performSelector:@selector(mDemoSelector001)];
	
	SEL oDemoSelector002 = @selector(mDemoSelector002);
	if ([self respondsToSelector:oDemoSelector002]) {
		[self performSelector:oDemoSelector002];
	} else {
		NSLog(@"No method by selector");
	}
	
	if ([self respondsToSelector:@selector(FakeSelector)]) {
		[self performSelector:@selector(FakeSelector)];
	} else {
		NSLog(@"No method by selector");
	}
	
	[self performSelector:@selector(mDemoSelector003:) withObject:@"Parameter string demo 1"];
	SEL oDemoSelector003 = @selector(mDemoSelector003:);
	[self performSelector:oDemoSelector003 withObject:@"Parameter string demo 2"];
	
	[self performSelector:@selector(mDemoSelector004:inNumber02:) withObject:@(1) withObject:@(2)];
	SEL oSelectorFromString = NSSelectorFromString(@"mDemoSelector004:inNumber02:");
	[self performSelector:oSelectorFromString withObject:@(3) withObject:@(4)];
	
	return YES;
}

-(void) mDemoSelector001 {__METHOD_NAME_TO_LOG}

-(void) mDemoSelector002 {__METHOD_NAME_TO_LOG}

-(void) mDemoSelector003:(NSString *) inString {

	__METHOD_NAME_TO_LOG
	NSLog(@"String from parameters: %@",inString);
}

-(void) mDemoSelector004: (NSNumber *) inNumber01 inNumber02:(NSNumber *) inNumber02 {

	__METHOD_NAME_TO_LOG
	NSLog(@"inNumber01: %@, inNumber02: %@",inNumber01,inNumber02);
}

@end

//
//  AppDelegate.m
//  NSArray
//
//  Created by Alexandr Kirilov on 27/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	NSInteger oArrayOfIntegers[5];
	int vArrayOfIntegersLength = sizeof(oArrayOfIntegers) / sizeof(NSInteger);
	for (int i = 0; i < vArrayOfIntegersLength; i++ ) {
		oArrayOfIntegers[i] = arc4random() % 100;
		NSLog(@"ArrayIntegers[%i]: %li",i,oArrayOfIntegers[i]);
	}
	
	NSArray *oNSArray00 = [[NSArray alloc] initWithObjects:@"one",@"two",@"three",nil];
	for (id element in oNSArray00 ) {
		NSLog(@"NSArray00 element: %@",element);
	}
	
	NSArray *oNSArray01 = [[NSArray alloc] initWithArray:oNSArray00];
	NSLog(@"%@",oNSArray01);
	
	NSLog(@"NSArray[1]%@",[oNSArray01 objectAtIndex:1]);
	NSLog(@"NSArray[0]%@",[oNSArray01 objectAtIndex:0]);
	NSLog(@"NSArray[2]%@",[oNSArray01 objectAtIndex:2]);
	
	NSLog(@"Object \"one\" index: %lu",[oNSArray01 indexOfObject:@"two"]);
	
	if (oNSArray01.count == oNSArray00.count) {
		NSLog(@"The Arrays length is equal");
	} else {
		NSLog(@"Arrays not equal by count");
	}
	
	NSMutableArray *oNSMutableArray00 = [NSMutableArray array];
	int vNSMutableArrayLength = 6;
	for (int i = 0; i < vNSMutableArrayLength; i++) {
		oNSMutableArray00[i] = [[NSNumber alloc] initWithInt:arc4random() % 100];
	}
	NSLog(@"%@",oNSMutableArray00);
	
	[oNSMutableArray00 insertObject:@"Inserted object" atIndex:2];
	NSLog(@"%@",oNSMutableArray00);
	
	[oNSMutableArray00 removeObject:@"Inserted object"];
	NSLog(@"%@",oNSMutableArray00);
	
	[oNSMutableArray00 sortUsingSelector:@selector(compare:)];
	NSLog(@"%@",oNSMutableArray00);
	
	oNSMutableArray00 = [[[oNSMutableArray00 reverseObjectEnumerator] allObjects] mutableCopy];
	NSLog(@"%@",oNSMutableArray00);
	
	return YES;
}

@end

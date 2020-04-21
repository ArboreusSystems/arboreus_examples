//
//  MainViewController.m
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-25.
//  Copyright © 2019 none. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void) viewDidLoad {

	[super viewDidLoad];

	Singleton *oSingleton1 = [Singleton mGetInstance];
	NSLog(@"oSingleton1 -> testString: %@",[oSingleton1 mGetString]);
	[oSingleton1 mSetTestString:@"New value from oSingleton1"];
	NSLog(@"oSingleton1 -> testString: %@",[oSingleton1 mGetString]);
	Singleton *oSingleton2 = [Singleton mGetInstance];
	NSLog(@"oSingleton2 -> testString: %@",[oSingleton2 mGetString]);

	ObjectBuilder *oBuilder = [[ObjectBuilder alloc] init];
	[oBuilder mSetVersion:[NSNumber numberWithInteger:1]];
	ObjectInstance *oObjectInstance1 = [oBuilder mBuildInstance];
	NSLog(@"oObjectInstance1 test string: %@",[oObjectInstance1 mGetString]);
	[oBuilder mSetVersion:[NSNumber numberWithInteger:2]];
	ObjectInstance *oObjectInstance2 = [oBuilder mBuildInstance];
	NSLog(@"oObjectInstance2 test string: %@",[oObjectInstance2 mGetString]);
	
	InUseClass* oInUseClass = [[InUseClass alloc] init];
	[oInUseClass mTestString];
}

-(IBAction) mButtonExit:(id)sender {

	[Handler mDoExit];
}

@end

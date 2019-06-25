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
}

-(IBAction) mButtonExit:(id)sender {

	[Handler mDoExit];
}

@end

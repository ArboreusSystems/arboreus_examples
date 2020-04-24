//
//  RootViewController.m
//  UIViewControllerLyfecycle
//
//  Created by Alexandr Kirilov on 13/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

-(void) loadView {
	
	[super loadView];
	_pName = @"1 >> RootViewController";
	_pTestString1 = @"RootViewController test string 1";
	_pTestString2 = @"RootViewController test string 2";
	NSLog(@"%@ -> loadView",_pName);
	[self.view setBackgroundColor:_COLOR_BLUE_LIGHT];
}

-(void) loadViewIfNeeded {
	
	[super loadView];
	NSLog(@"%@ -> loadViewIfNeeded",_pName);
}

-(void) viewDidLoad {
	
	[super viewDidLoad];
	NSLog(@"%@ -> viewDidLoad",_pName);
}

-(void) viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	NSLog(@"%@ -> viewWillAppear",_pName);
}

-(void) viewWillLayoutSubviews {
	
	[super viewWillLayoutSubviews];
	NSLog(@"%@ -> viewWillLayoutSubviews",_pName);
}

-(void) viewDidLayoutSubviews {

	[super viewDidLayoutSubviews];
	NSLog(@"%@ -> viewDidLayoutSubviews",_pName);
}

-(void) viewDidAppear:(BOOL)animated {
	
	[super viewDidAppear:animated];
	NSLog(@"%@ -> viewDidAppear",_pName);
}

-(void) viewWillDisappear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	NSLog(@"%@ -> viewWillAppear",_pName);
}

-(void) viewDidDisappear:(BOOL)animated {
	
	[super viewDidDisappear:animated];
	NSLog(@"%@ -> viewDidDisappear",_pName);
}

-(void) mTestMethod1 {
	
	NSLog(@"From %@::mTestMethod1",_pName);
}

-(void) mTestMethod2 {
	
	NSLog(@"From %@::mTestMethod2",_pName);
}

@end

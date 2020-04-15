//
//  RootNavigationController.m
//  VLCTestObjectiveC
//
//  Created by Alexandr Kirilov on 14/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

-(void)viewDidLoad {
	
    [super viewDidLoad];
	
	MainViewController* oMainViewController = [[MainViewController alloc] init];
	[self setViewControllers:@[oMainViewController] animated:YES];
}

@end

//
//  RootNavigationController.m
//  Orientation
//
//  Created by Alexandr Kirilov on 15/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

-(void) loadView {
	
	[super loadView];
	DemoViewController* oDemoVC = [[DemoViewController alloc] init];
	[self setViewControllers:@[oDemoVC]];
}

-(void) viewDidLoad {
	
    [super viewDidLoad];
}

@end

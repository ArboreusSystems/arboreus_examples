//
//  RotatedViewController.m
//  Orientation
//
//  Created by Alexandr Kirilov on 15/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "RotatedViewController.h"

@interface RotatedViewController ()

@end

@implementation RotatedViewController

-(void) loadView {
	
	[super loadView];
}

-(void) viewDidLoad {
	
	[super viewDidLoad];
	[self.view setBackgroundColor:__COLOR_GREEN_LIGHT];
	
	UILabel* oTestLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
	[oTestLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oTestLabel setText:@"Test label"];
	[oTestLabel setBackgroundColor:__COLOR_WHITE];
	[oTestLabel setTextAlignment:NSTextAlignmentCenter];
	[self.view addSubview:oTestLabel];
	[[oTestLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
	[[oTestLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
	[[oTestLabel.widthAnchor constraintEqualToConstant:300.0] setActive:YES];
	[[oTestLabel.heightAnchor constraintEqualToConstant:50.0] setActive:YES];
}

-(void) viewDidAppear:(BOOL)animated {
	
	[super viewDidAppear:animated];
	
	[UIView setAnimationsEnabled:NO];
	[[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeLeft) forKey:@"orientation"];
	[UIView setAnimationsEnabled:YES];
}



@end

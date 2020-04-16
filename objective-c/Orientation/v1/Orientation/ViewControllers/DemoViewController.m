//
//  DemoViewController.m
//  Orientation
//
//  Created by Alexandr Kirilov on 15/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

-(void) loadView {
	
	[super loadView];
	[self setTitle:@"Demo"];
}

-(void) viewDidLoad {
	
	[super viewDidLoad];
	[self.view setBackgroundColor:__COLOR_WHITE];
	
	UIButton* oButtonRotated = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
	[oButtonRotated setTitle:@"Rotated" forState:UIControlStateNormal];
	[oButtonRotated setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oButtonRotated addTarget:self action:@selector(mActionButtonRotated) forControlEvents:UIControlEventTouchUpInside];
	[oButtonRotated setBackgroundColor:__COLOR_GREEN_LIGHT];
	[self.view addSubview:oButtonRotated];
	[[oButtonRotated.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
	[[oButtonRotated.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
	[[oButtonRotated.widthAnchor constraintEqualToConstant:300.0] setActive:YES];
	[[oButtonRotated.heightAnchor constraintEqualToConstant:50.0] setActive:YES];
	
}

-(void) mActionButtonRotated {
	
	NSLog(@"Button Rotated clicked");
	RotatedViewController* oRotatedVC = [[RotatedViewController alloc] init];
	[self.navigationController pushViewController:oRotatedVC animated:YES];
}

@end

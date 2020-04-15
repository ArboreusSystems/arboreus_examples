//
//  MainViewController.m
//  VLCTestObjectiveC
//
//  Created by Alexandr Kirilov on 08/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void) loadView {
	
	[super loadView];
	self.view.backgroundColor = __COLOR_WHITE;
	self.pHandlerVLC = [HandlerVLC mInstance];
	self.pPlayer = _pHandlerVLC.pPlayer;
	[self setTitle:@"Main"];
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	UIButton* oButtonSecondVC = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
	[oButtonSecondVC setTitle:@"Second" forState:UIControlStateNormal];
	[oButtonSecondVC setBackgroundColor:__COLOR_BLUE_DARK];
	[oButtonSecondVC addTarget:self action:@selector(mActionButtonSecondVC) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:oButtonSecondVC];
	oButtonSecondVC.center = self.view.center;
	
	[self.view addSubview:_pHandlerVLC.pPlayerView];
	[[_pHandlerVLC.pPlayerView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.heightAnchor constraintEqualToConstant:250] setActive:YES];
	
	[_pPlayer play];
}

-(void) viewWillAppear:(BOOL)animated {
	
	[self.view addSubview:_pHandlerVLC.pPlayerView];
	[[_pHandlerVLC.pPlayerView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.heightAnchor constraintEqualToConstant:250] setActive:YES];
}

-(void) mActionButtonSecondVC {
	
	NSLog(@"ButtonSecondVC clicked");
	
	SecondViewController* oSecondVC = [[SecondViewController alloc] init];
	[self.navigationController pushViewController:oSecondVC animated:YES];
}


@end

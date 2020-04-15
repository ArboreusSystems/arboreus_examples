//
//  SecondViewController.m
//  VLCTestObjectiveC
//
//  Created by Alexandr Kirilov on 14/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(void) loadView {
	
	[super loadView];
	self.view.backgroundColor = __COLOR_BLUE;
	self.pHandlerVLC = [HandlerVLC mInstance];
	self.pPlayer = _pHandlerVLC.pPlayer;
	[self setTitle:@"Second"];
}

-(void)viewDidLoad {
	
    [super viewDidLoad];
	
	[self.view addSubview:_pHandlerVLC.pPlayerView];
	[[_pHandlerVLC.pPlayerView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.heightAnchor constraintEqualToConstant:250] setActive:YES];
}

@end

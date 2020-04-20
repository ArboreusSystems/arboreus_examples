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

- (instancetype)init
{
	self = [super init];
	if (self) {
		
		NSLog(@"init");
		
		[self setTitle:@"Main"];
		self.pHandlerVLC = [HandlerVLC mInstance];
		self.pPlayer = _pHandlerVLC.pPlayer;
		
		_pPlayerOverlayTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mHandlerOverlayTapGesture)];
		
		_pContent = [[UIView alloc] init];
		[_pContent setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_pContent setBackgroundColor:__COLOR_PURPLE];
		
		_pButtonSecondVC = [[UIButton alloc] init];
		[_pButtonSecondVC setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_pButtonSecondVC setTitle:@"Second" forState:UIControlStateNormal];
		[_pButtonSecondVC setBackgroundColor:__COLOR_BLUE_DARK];
		[_pButtonSecondVC addTarget:self action:@selector(mActionButtonSecondVC) forControlEvents:UIControlEventTouchUpInside];
		
		_pPlayerView = [[UIView alloc] init];
		[_pPlayerView setTranslatesAutoresizingMaskIntoConstraints:NO];
		
		_pPlayerOverlay = [[UIView alloc] init];
		[_pPlayerOverlay setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_pPlayerOverlay addGestureRecognizer:_pPlayerOverlayTapGesture];
		
		_pPlayerOverlayContent = [[UIView alloc] init];
		[_pPlayerOverlayContent setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_pPlayerOverlayContent setBackgroundColor:__COLOR_GREEN_TRANSPARENT];
		[_pPlayerOverlayContent setHidden:YES];
		
	}
	return self;
}

-(void) loadView {
	
	NSLog(@"loadView");
	
	[super loadView];
	self.view.backgroundColor = __COLOR_WHITE;
}

-(void) loadViewIfNeeded {
	
	NSLog(@"loadViewIfNeeded");
	[super loadViewIfNeeded];
}

- (void)viewDidLoad {
	
	NSLog(@"viewDidLoad");
	
	[super viewDidLoad];
	
	[self.view addSubview:_pContent];
	[[_pContent.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pContent.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[_pContent.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[_pContent.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	
	[_pContent addSubview:_pPlayerView];
	[[_pPlayerView.topAnchor constraintEqualToAnchor:_pContent.topAnchor] setActive:YES];
	[[_pPlayerView.leftAnchor constraintEqualToAnchor:_pContent.leftAnchor] setActive:YES];
	[[_pPlayerView.rightAnchor constraintEqualToAnchor:_pContent.rightAnchor] setActive:YES];
	[[_pPlayerView.heightAnchor constraintEqualToConstant:250] setActive:YES];
	
	[_pContent addSubview:_pButtonSecondVC];
	[_pButtonSecondVC removeConstraints:_pButtonSecondVC.constraints];
	[[_pButtonSecondVC.centerYAnchor constraintEqualToAnchor:_pContent.centerYAnchor] setActive:YES];
	[[_pButtonSecondVC.centerXAnchor constraintEqualToAnchor:_pContent.centerXAnchor] setActive:YES];
	[[_pButtonSecondVC.widthAnchor constraintEqualToConstant:200.0] setActive:YES];
	[[_pButtonSecondVC.heightAnchor constraintEqualToConstant:50.0] setActive:YES];
	
	[_pPlayer play];
}

-(void) viewWillAppear:(BOOL)animated {
	
	NSLog(@"viewWillAppear");
	[super viewWillAppear:animated];
	
	[_pPlayerView addSubview:_pHandlerVLC.pPlayerView];
	[_pPlayerView addSubview:_pPlayerOverlay];
	[_pPlayerOverlay addSubview:_pPlayerOverlayContent];
}

-(void) viewWillLayoutSubviews {
	
	NSLog(@"viewWillLayoutSubviews");
	[super viewWillLayoutSubviews];
	
	[_pHandlerVLC.pPlayerView removeConstraints:_pHandlerVLC.pPlayerView.constraints];
	[[_pHandlerVLC.pPlayerView.topAnchor constraintEqualToAnchor:_pPlayerView.topAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.bottomAnchor constraintEqualToAnchor:_pPlayerView.bottomAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.leftAnchor constraintEqualToAnchor:_pPlayerView.leftAnchor] setActive:YES];
	[[_pHandlerVLC.pPlayerView.rightAnchor constraintEqualToAnchor:_pPlayerView.rightAnchor] setActive:YES];
	
	[_pPlayerOverlay removeConstraints:_pPlayerOverlay.constraints];
	[[_pPlayerOverlay.topAnchor constraintEqualToAnchor:_pPlayerView.topAnchor] setActive:YES];
	[[_pPlayerOverlay.bottomAnchor constraintEqualToAnchor:_pPlayerView.bottomAnchor] setActive:YES];
	[[_pPlayerOverlay.leftAnchor constraintEqualToAnchor:_pPlayerView.leftAnchor] setActive:YES];
	[[_pPlayerOverlay.rightAnchor constraintEqualToAnchor:_pPlayerView.rightAnchor] setActive:YES];
	
	[_pPlayerOverlayContent removeConstraints:_pPlayerOverlayContent.constraints];
	[[_pPlayerOverlayContent.topAnchor constraintEqualToAnchor:_pPlayerView.topAnchor] setActive:YES];
	[[_pPlayerOverlayContent.bottomAnchor constraintEqualToAnchor:_pPlayerView.bottomAnchor] setActive:YES];
	[[_pPlayerOverlayContent.leftAnchor constraintEqualToAnchor:_pPlayerView.leftAnchor] setActive:YES];
	[[_pPlayerOverlayContent.rightAnchor constraintEqualToAnchor:_pPlayerView.rightAnchor] setActive:YES];
}

-(void) viewDidLayoutSubviews {
	
	NSLog(@"viewDidLayoutSubviews");
	[super viewDidLayoutSubviews];
}

-(void) viewDidAppear:(BOOL)animated {
	
	NSLog(@"viewDidAppear");
	[super viewDidAppear:animated];
}

-(void) viewWillDisappear:(BOOL)animated {
	
	NSLog(@"viewWillDisappear");
	[super viewWillDisappear:animated];
}

-(void) viewDidDisappear:(BOOL)animated {
	
	NSLog(@"viewDidDisappear");
	[super viewDidDisappear:animated];
}

-(void) mActionButtonSecondVC {
	
	NSLog(@"ButtonSecondVC clicked");
	
	SecondViewController* oSecondVC = [[SecondViewController alloc] init];
	[self.navigationController pushViewController:oSecondVC animated:YES];
}

-(void) mHandlerOverlayTapGesture {
	
	NSLog(@"mHandlerOverlayTapGesture");
	if ([_pPlayerOverlayContent isHidden]) {
		[_pPlayerOverlayContent setHidden:NO];
	} else {
		[_pPlayerOverlayContent setHidden:YES];
	}
}

@end

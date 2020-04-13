//
//  DefaultViewViewController.m
//  SafeArea
//
//  Created by Alexandr Kirilov on 12/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "DefaultViewController.h"

@interface DefaultViewController ()

@end

@implementation DefaultViewController

-(void) viewDidLoad {
	
	[super viewDidLoad];
//	[self.view setBackgroundColor:__COLOR_BLUE_DARK];
	[self setEdgesForExtendedLayout:UIRectEdgeNone];
	
	UIView* oContentView = [[UIView alloc] init];
	[oContentView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oContentView setBackgroundColor:__COLOR_GREEN_LIGHT];
	
	UIView* oWrapperView = [[UIView alloc] init];
	[oWrapperView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oWrapperView setBackgroundColor:__COLOR_GREEN];
		
	UIView* oCenterObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oCenterObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oCenterObject setBackgroundColor:__COLOR_PURPLE];
	
	UIView* oLeftTopObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oLeftTopObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oLeftTopObject setBackgroundColor:__COLOR_PURPLE];
	
	UIView* oRightTopObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oRightTopObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oRightTopObject setBackgroundColor:__COLOR_PURPLE];
	
	UIView* oLeftBottomObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oLeftBottomObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oLeftBottomObject setBackgroundColor:__COLOR_PURPLE];
	
	UIView* oRightBottomObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oRightBottomObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oRightBottomObject setBackgroundColor:__COLOR_PURPLE];
	
	[self.view addSubview:oWrapperView];
	[[oWrapperView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[oWrapperView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[oWrapperView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:YES];
	[[oWrapperView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:YES];
	
	[oWrapperView addSubview:oContentView];
	[[oContentView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[oContentView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[oContentView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[oContentView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	
	[oContentView addSubview:oCenterObject];
	[[oCenterObject.centerYAnchor constraintEqualToAnchor:oContentView.centerYAnchor] setActive:YES];
	[[oCenterObject.centerXAnchor constraintEqualToAnchor:oContentView.centerXAnchor] setActive:YES];
	[[oCenterObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oCenterObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[oContentView addSubview:oLeftTopObject];
	[[oLeftTopObject.topAnchor constraintEqualToAnchor:oContentView.topAnchor] setActive:YES];
	[[oLeftTopObject.leftAnchor constraintEqualToAnchor:oContentView.leftAnchor] setActive:YES];
	[[oLeftTopObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oLeftTopObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[oContentView addSubview:oRightTopObject];
	[[oRightTopObject.topAnchor constraintEqualToAnchor:oContentView.topAnchor] setActive:YES];
	[[oRightTopObject.rightAnchor constraintEqualToAnchor:oContentView.rightAnchor] setActive:YES];
	[[oRightTopObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oRightTopObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[oContentView addSubview:oLeftBottomObject];
	[[oLeftBottomObject.bottomAnchor constraintEqualToAnchor:oContentView.bottomAnchor] setActive:YES];
	[[oLeftBottomObject.leftAnchor constraintEqualToAnchor:oContentView.leftAnchor] setActive:YES];
	[[oLeftBottomObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oLeftBottomObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[oContentView addSubview:oRightBottomObject];
	[[oRightBottomObject.bottomAnchor constraintEqualToAnchor:oContentView.bottomAnchor] setActive:YES];
	[[oRightBottomObject.rightAnchor constraintEqualToAnchor:oContentView.rightAnchor] setActive:YES];
	[[oRightBottomObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oRightBottomObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	UITapGestureRecognizer* oTapReckognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mHandlerTapGesture)];
	[self.view addGestureRecognizer:oTapReckognizer];
}

#pragma mark Gesture Recognizers

-(void) mHandlerTapGesture {
	
	NSLog(@"Tap Gesture handled");
	if (self.navigationController.navigationBarHidden) {
		[self.navigationController setNavigationBarHidden:NO animated:YES];
		self.statusBarHidden = NO;
		[self setNeedsStatusBarAppearanceUpdate];
	} else {
		[self.navigationController setNavigationBarHidden:YES animated:YES];
		self.statusBarHidden = YES;
		[self setNeedsStatusBarAppearanceUpdate];
	}
}

-(BOOL) prefersStatusBarHidden {
	return self.statusBarHidden;
}

@end

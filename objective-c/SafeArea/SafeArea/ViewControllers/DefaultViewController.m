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
	
	UIView* oWrapperView = [[UIView alloc] init];
	[oWrapperView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oWrapperView setBackgroundColor:__COLOR_GREEN_LIGHT];
		
	UIView* oCenterObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oCenterObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oCenterObject setBackgroundColor:__COLOR_WHITE];
	
	UIView* oLeftTopObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oLeftTopObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oLeftTopObject setBackgroundColor:__COLOR_WHITE_CLEAN];
	
	UIView* oRightTopObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oRightTopObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oRightTopObject setBackgroundColor:__COLOR_WHITE_CLEAN];
	
	UIView* oLeftBottomObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oLeftBottomObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oLeftBottomObject setBackgroundColor:__COLOR_WHITE_CLEAN];
	
	UIView* oRightBottomObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oRightBottomObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oRightBottomObject setBackgroundColor:__COLOR_WHITE_CLEAN];
	
	[self.view addSubview:oWrapperView];
	[[oWrapperView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[oWrapperView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[oWrapperView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[oWrapperView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	
	[oWrapperView addSubview:oCenterObject];
	[[oCenterObject.centerYAnchor constraintEqualToAnchor:oWrapperView.centerYAnchor] setActive:YES];
	[[oCenterObject.centerXAnchor constraintEqualToAnchor:oWrapperView.centerXAnchor] setActive:YES];
	[[oCenterObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oCenterObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[oWrapperView addSubview:oLeftTopObject];
	[[oLeftTopObject.topAnchor constraintEqualToAnchor:oWrapperView.topAnchor] setActive:YES];
	[[oLeftTopObject.leftAnchor constraintEqualToAnchor:oWrapperView.leftAnchor] setActive:YES];
	[[oLeftTopObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oLeftTopObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[oWrapperView addSubview:oRightTopObject];
	[[oRightTopObject.topAnchor constraintEqualToAnchor:oWrapperView.topAnchor] setActive:YES];
	[[oRightTopObject.rightAnchor constraintEqualToAnchor:oWrapperView.rightAnchor] setActive:YES];
	[[oRightTopObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oRightTopObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[oWrapperView addSubview:oLeftBottomObject];
	[[oLeftBottomObject.bottomAnchor constraintEqualToAnchor:oWrapperView.bottomAnchor] setActive:YES];
	[[oLeftBottomObject.leftAnchor constraintEqualToAnchor:oWrapperView.leftAnchor] setActive:YES];
	[[oLeftBottomObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oLeftBottomObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[oWrapperView addSubview:oRightBottomObject];
	[[oRightBottomObject.bottomAnchor constraintEqualToAnchor:oWrapperView.bottomAnchor] setActive:YES];
	[[oRightBottomObject.rightAnchor constraintEqualToAnchor:oWrapperView.rightAnchor] setActive:YES];
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

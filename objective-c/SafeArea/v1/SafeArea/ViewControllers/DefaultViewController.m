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
	[self setEdgesForExtendedLayout:UIRectEdgeNone];
	
	_pViewContent = [[UIView alloc] init];
	[_pViewContent setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_pViewContent setBackgroundColor:__COLOR_GREEN_LIGHT];
	
	_pViewWarpper = [[UIView alloc] init];
	[_pViewWarpper setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_pViewWarpper setBackgroundColor:__COLOR_GREEN];
		
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
	
	[self.view addSubview:_pViewWarpper];
	[[_pViewWarpper.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pViewWarpper.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[_pViewWarpper.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:YES];
	[[_pViewWarpper.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:YES];
	
	[_pViewWarpper addSubview:_pViewContent];
	[[_pViewContent.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pViewContent.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[_pViewContent.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[_pViewContent.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	
	[_pViewContent addSubview:oCenterObject];
	[[oCenterObject.centerYAnchor constraintEqualToAnchor:_pViewContent.centerYAnchor] setActive:YES];
	[[oCenterObject.centerXAnchor constraintEqualToAnchor:_pViewContent.centerXAnchor] setActive:YES];
	[[oCenterObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oCenterObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[_pViewContent addSubview:oLeftTopObject];
	[[oLeftTopObject.topAnchor constraintEqualToAnchor:_pViewContent.topAnchor] setActive:YES];
	[[oLeftTopObject.leftAnchor constraintEqualToAnchor:_pViewContent.leftAnchor] setActive:YES];
	[[oLeftTopObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oLeftTopObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[_pViewContent addSubview:oRightTopObject];
	[[oRightTopObject.topAnchor constraintEqualToAnchor:_pViewContent.topAnchor] setActive:YES];
	[[oRightTopObject.rightAnchor constraintEqualToAnchor:_pViewContent.rightAnchor] setActive:YES];
	[[oRightTopObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oRightTopObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[_pViewContent addSubview:oLeftBottomObject];
	[[oLeftBottomObject.bottomAnchor constraintEqualToAnchor:_pViewContent.bottomAnchor] setActive:YES];
	[[oLeftBottomObject.leftAnchor constraintEqualToAnchor:_pViewContent.leftAnchor] setActive:YES];
	[[oLeftBottomObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oLeftBottomObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	[_pViewContent addSubview:oRightBottomObject];
	[[oRightBottomObject.bottomAnchor constraintEqualToAnchor:_pViewContent.bottomAnchor] setActive:YES];
	[[oRightBottomObject.rightAnchor constraintEqualToAnchor:_pViewContent.rightAnchor] setActive:YES];
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
		[self.navigationController.view setBackgroundColor:__COLOR_BLUE_DARK];
		[_pViewWarpper setBackgroundColor:__COLOR_GREEN_DARK];
	} else {
		[self.navigationController setNavigationBarHidden:YES animated:YES];
		self.statusBarHidden = YES;
		[self setNeedsStatusBarAppearanceUpdate];
		[self.navigationController.view setBackgroundColor:__COLOR_BLACK];
		[_pViewWarpper setBackgroundColor:__COLOR_BLACK];
	}
}

-(BOOL) prefersStatusBarHidden {
	return self.statusBarHidden;
}

@end

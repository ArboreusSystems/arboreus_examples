//
//  SubclassedViewController.m
//  SafeArea
//
//  Created by Alexandr Kirilov on 13/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "SubclassedViewController.h"

@interface SubclassedViewController ()

@end

@implementation SubclassedViewController

-(void) viewDidLoad {
	
	[super viewDidLoad];
	
	UIView* oCenterObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oCenterObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oCenterObject setBackgroundColor:__COLOR_PURPLE];
	[super.pViewContent addSubview:oCenterObject];
	[[oCenterObject.centerYAnchor constraintEqualToAnchor:super.pViewContent.centerYAnchor] setActive:YES];
	[[oCenterObject.centerXAnchor constraintEqualToAnchor:super.pViewContent.centerXAnchor] setActive:YES];
	[[oCenterObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oCenterObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	UIView* oLeftTopObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oLeftTopObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oLeftTopObject setBackgroundColor:__COLOR_PURPLE];
	[super.pViewContent addSubview:oLeftTopObject];
	[[oLeftTopObject.topAnchor constraintEqualToAnchor:super.pViewContent.topAnchor] setActive:YES];
	[[oLeftTopObject.leftAnchor constraintEqualToAnchor:super.pViewContent.leftAnchor] setActive:YES];
	[[oLeftTopObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oLeftTopObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	UIView* oRightTopObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oRightTopObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oRightTopObject setBackgroundColor:__COLOR_PURPLE];
	[super.pViewContent addSubview:oRightTopObject];
	[[oRightTopObject.topAnchor constraintEqualToAnchor:super.pViewContent.topAnchor] setActive:YES];
	[[oRightTopObject.rightAnchor constraintEqualToAnchor:super.pViewContent.rightAnchor] setActive:YES];
	[[oRightTopObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oRightTopObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	UIView* oLeftBottomObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oLeftBottomObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oLeftBottomObject setBackgroundColor:__COLOR_PURPLE];
	[super.pViewContent addSubview:oLeftBottomObject];
	[[oLeftBottomObject.bottomAnchor constraintEqualToAnchor:super.pViewContent.bottomAnchor] setActive:YES];
	[[oLeftBottomObject.leftAnchor constraintEqualToAnchor:super.pViewContent.leftAnchor] setActive:YES];
	[[oLeftBottomObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oLeftBottomObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
	
	UIView* oRightBottomObject = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[oRightBottomObject setTranslatesAutoresizingMaskIntoConstraints:NO];
	[oRightBottomObject setBackgroundColor:__COLOR_PURPLE];
	[super.pViewContent addSubview:oRightBottomObject];
	[[oRightBottomObject.bottomAnchor constraintEqualToAnchor:super.pViewContent.bottomAnchor] setActive:YES];
	[[oRightBottomObject.rightAnchor constraintEqualToAnchor:super.pViewContent.rightAnchor] setActive:YES];
	[[oRightBottomObject.widthAnchor constraintEqualToConstant:10.0] setActive:YES];
	[[oRightBottomObject.heightAnchor constraintEqualToConstant:10.0] setActive:YES];
}

-(void) mHandlerTapGesture {
	
	[super mHandlerTapGesture];
	NSLog(@"SubclassedViewController -> Tap Gesture handled");
	if (self.navigationController.navigationBarHidden) {
		[self.navigationController setNavigationBarHidden:NO animated:YES];
		[super mSetStatusBarHidden:NO];
		[self.navigationController.view setBackgroundColor:__COLOR_BLUE_DARK];
		[super.pViewWrapper setBackgroundColor:__COLOR_GREEN_DARK];
	} else {
		[self.navigationController setNavigationBarHidden:YES animated:YES];
		[super mSetStatusBarHidden:YES];
		[self.navigationController.view setBackgroundColor:__COLOR_BLACK];
		[super.pViewWrapper setBackgroundColor:__COLOR_BLACK];
	}
}

@end

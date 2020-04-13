//
//  TemplateViewController.m
//  SafeArea
//
//  Created by Alexandr Kirilov on 13/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "TemplateViewController.h"

@interface TemplateViewController ()

@end

@implementation TemplateViewController

-(void) loadView {
	
	[super loadView];
	
	_pViewContent = [[UIView alloc] init];
	[_pViewContent setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_pViewContent setBackgroundColor:__COLOR_GREEN];
	
	_pViewWrapper = [[UIView alloc] init];
	[_pViewWrapper setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_pViewWrapper setBackgroundColor:__COLOR_GREEN_DARK];
}

-(void) viewDidLoad {
	
	[super viewDidLoad];
	
	[self.view addSubview:_pViewWrapper];
	[[_pViewWrapper.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pViewWrapper.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[_pViewWrapper.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:YES];
	[[_pViewWrapper.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:YES];
	
	[_pViewWrapper addSubview:_pViewContent];
	[[_pViewContent.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pViewContent.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[_pViewContent.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[_pViewContent.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	
	UITapGestureRecognizer* oTapReckognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mHandlerTapGesture)];
	[self.view addGestureRecognizer:oTapReckognizer];
}

-(void) mHandlerTapGesture {
	
	NSLog(@"TemplateViewController -> Tap Gesture handled");
}

-(void) mSetStatusBarHidden:(BOOL)inStatus {
	
	_pStatusBarHidden = inStatus;
	[self setNeedsStatusBarAppearanceUpdate];
}

-(BOOL) prefersStatusBarHidden {
	
	return self.pStatusBarHidden;
}

@end

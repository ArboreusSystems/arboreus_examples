//
//  VCTemplate.m
//  StackView
//
//  Created by Alexandr Kirilov on 28/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "VCTemplate.h"

@interface VCTemplate ()

@end

@implementation VCTemplate


// --------------------------------------
#pragma mark - Init

@synthesize pContentWrapper;
@synthesize pContent;

-(instancetype) init {

	NSLog(@"init");

	self = [super init];
	if (self) {
		
		pContentWrapper = [[UIView alloc] init];
		[pContentWrapper setTranslatesAutoresizingMaskIntoConstraints:NO];
		[pContentWrapper setBackgroundColor:__COLOR_BLUE_LIGHT];
		
		pContent = [[UIView alloc] init];
		[pContent setTranslatesAutoresizingMaskIntoConstraints:NO];
		[pContent setBackgroundColor:__COLOR_BLUE_DARK];
		
	}
	return self;
}


// --------------------------------------
#pragma mark - Lifecycle

-(void) loadView {

	NSLog(@"loadView");
	[super loadView];
	
//	[self.view addSubview:pContentWrapper];
//	[[pContentWrapper.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
//	[[pContentWrapper.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
//	[[pContentWrapper.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:YES];
//	[[pContentWrapper.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:YES];
//
//	[pContentWrapper addSubview:pContent];
//	[[pContent.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
//	[[pContent.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
//	[[pContent.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
//	[[pContent.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
}

-(void) loadViewIfNeeded {
	
	NSLog(@"loadViewIfNeeded");
	[super loadViewIfNeeded];
}

-(void) viewDidLoad {
	
	NSLog(@"viewDidLoad");
	[super viewDidLoad];
	
	[self.view addSubview:pContentWrapper];
	[[pContentWrapper.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[pContentWrapper.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[pContentWrapper.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:YES];
	[[pContentWrapper.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:YES];
	
	[pContentWrapper addSubview:pContent];
	[[pContent.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[pContent.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[pContent.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[pContent.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
}

-(void) viewWillAppear:(BOOL)animated {

	NSLog(@"viewWillAppear");
	[super viewWillAppear:animated];
}

-(void) viewWillLayoutSubviews {
	
	NSLog(@"viewWillLayoutSubviews");
	[super viewWillLayoutSubviews];
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
	[super viewWillAppear:animated];
}

-(void) viewDidDisappear:(BOOL)animated {
	
	NSLog(@"viewDidDisappear");
	[super viewDidDisappear:animated];
}


// --------------------------------------
#pragma mark - UI Components Layout

-(void) mLayoutContent:(CGFloat)inBottomPadding {

	[[pContent.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[pContent.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[pContent.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[pContent.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
}


@end

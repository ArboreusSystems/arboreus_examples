//
//  VCMain.m
//  StackView
//
//  Created by Alexandr Kirilov on 28/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "VCMain.h"

@interface VCMain ()

@end

@implementation VCMain

-(instancetype) init {

	self = [super init];
	if (self) {
	
		NSLog(@"Init");
		
		[self setTitle:@"Main"];
		[self.view setBackgroundColor:__COLOR_GREEN];
		
		pIsKeyboardShowing = NO;
		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mKeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mKeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mWillResignActive) name:UIApplicationWillResignActiveNotification object:nil];
	}
	return self;
}

-(void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) loadView {

	[super loadView];
	
	_pFieldUser = [[UITextField alloc] init];
	[[_pFieldUser.heightAnchor constraintEqualToConstant:50.0] setActive:YES];
	[_pFieldUser setPlaceholder:@"User name"];
	[_pFieldUser setTextColor:__COLOR_BLACK_DARK];
	[_pFieldUser setBackgroundColor:__COLOR_WHITE];
	[_pFieldUser setMinimumFontSize:15.0];
	[_pFieldUser setTextAlignment:NSTextAlignmentLeft];
	[_pFieldUser setBorderStyle:UITextBorderStyleRoundedRect];
	[_pFieldUser setKeyboardType:UIKeyboardTypeDefault];
	[_pFieldUser setDelegate:self];
//	[_pFieldUser setReturnKeyType:UIReturnKeyNext];
	
	_pFieldPassword = [[UITextField alloc] init];
	[[_pFieldPassword.heightAnchor constraintEqualToConstant:50.0] setActive:YES];
	[_pFieldPassword setPlaceholder:@"Password"];
	[_pFieldPassword setTextColor:__COLOR_BLACK_DARK];
	[_pFieldPassword setBackgroundColor:__COLOR_WHITE];
	[_pFieldPassword setMinimumFontSize:15.0];
	[_pFieldPassword setTextAlignment:NSTextAlignmentLeft];
	[_pFieldPassword setSecureTextEntry:YES];
	[_pFieldPassword setBorderStyle:UITextBorderStyleRoundedRect];
	[_pFieldPassword setKeyboardType:UIKeyboardTypeDefault];
	[_pFieldPassword setDelegate:self];
//	[_pFieldPassword setReturnKeyType:UIReturnKeyDone];
	
	_pButtonOk = [UIButton buttonWithType:UIButtonTypeSystem];
	[[_pButtonOk.heightAnchor constraintEqualToConstant:50.0] setActive:YES];
	[_pButtonOk setTitle:@"Ok" forState:UIControlStateNormal];
	[_pButtonOk setBackgroundColor:__COLOR_BLUE_DARK];
	[_pButtonOk setTitleColor:__COLOR_WHITE forState:UIControlStateNormal];
	[_pButtonOk addTarget:self action:@selector(mActionButtonOk) forControlEvents:UIControlEventTouchUpInside];
	
	_pStackView = [[UIStackView alloc] initWithArrangedSubviews:@[
		_pFieldUser,
		_pFieldPassword,
		_pButtonOk
	]];
	[_pStackView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_pStackView setAxis:UILayoutConstraintAxisVertical];
	[_pStackView setDistribution:UIStackViewDistributionFill];
	[_pStackView setAlignment:UIStackViewAlignmentFill];
	[_pStackView setSpacing:20.0];
	[_pStackView setLayoutMarginsRelativeArrangement:YES];
	[_pStackView setLayoutMargins:UIEdgeInsetsMake(25, 25, 25, 25)];
	
	_pScrollView = [[UIScrollView alloc] init];
	[_pScrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_pScrollView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
	[_pScrollView setShowsHorizontalScrollIndicator:NO];
	[_pScrollView setBounces:YES];
}

-(void) viewDidLoad {
	
	[super viewDidLoad];
	[self.view addSubview:_pScrollView];
	[_pScrollView addSubview:_pStackView];
	
	NSLog(@"viewDidLoad ->> Height: %f Width: %f",_pStackView.bounds.size.height,_pStackView.bounds.size.width);
}

-(void) viewDidLayoutSubviews {
	
	NSLog(@"viewDidLayoutSubviews ->> Height: %f Width: %f",_pStackView.bounds.size.height,_pStackView.bounds.size.width);
	[super viewDidLayoutSubviews];
	
	[_pScrollView setContentSize:_pStackView.bounds.size];
	
	[[_pScrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor] setActive:YES];
	[[_pScrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor] setActive:YES];
	[[_pScrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor] setActive:YES];
	[[_pScrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor] setActive:YES];

	[[_pStackView.topAnchor constraintEqualToAnchor:_pScrollView.topAnchor] setActive:YES];
	[[_pStackView.bottomAnchor constraintEqualToAnchor:_pScrollView.bottomAnchor] setActive:YES];
	[[_pStackView.leadingAnchor constraintEqualToAnchor:_pScrollView.leadingAnchor] setActive:YES];
	[[_pStackView.trailingAnchor constraintEqualToAnchor:_pScrollView.trailingAnchor] setActive:YES];
	[[_pStackView.widthAnchor constraintEqualToAnchor:_pScrollView.widthAnchor] setActive:YES];
}

-(void) viewWillAppear:(BOOL)animated {

	NSLog(@"viewWillAppear ->> Height: %f Width: %f",_pStackView.bounds.size.height,_pStackView.bounds.size.width);
	[super viewWillAppear:animated];
}

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {

	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
	NSLog(@"viewWillTransitionToSize");
	if (pIsKeyboardShowing) {
		[self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - pKeyboardFrame.size.height)];
		[self.view layoutIfNeeded];
	}
}

-(void) mActionButtonOk {

	NSLog(@"mActionButtonOk");
}

-(void) mKeyboardWillChangeFrame:(NSNotification *)sender {
	
	NSLog(@"mKeyboardWillHide");
}

-(void) mKeyboardWillHide:(NSNotification *)sender {
	
	NSLog(@"mKeyboardWillHide");
	
	if (pIsKeyboardShowing) {
		pIsKeyboardShowing = NO;
		[self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + pKeyboardFrame.size.height)];
		[self.view layoutIfNeeded];
	}
}

-(void) mKeyboardDidShow:(NSNotification *)sender {

	NSLog(@"mKeyboardDidShow");
	
	if (!pIsKeyboardShowing) {
		pIsKeyboardShowing = YES;
		pKeyboardFrame = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
		[self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - pKeyboardFrame.size.height)];
		[self.view layoutIfNeeded];
	}
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {

	NSLog(@"textFieldShouldReturn");
	
	[textField resignFirstResponder];
	return YES;
}

-(void) mWillEnterForeground {
	
	NSLog(@"mWillEnterForeground");
}

-(void) mDidEnterBackground {

	NSLog(@"mDidEnterBackground");
}

-(void) mDidBecomeActive {

	NSLog(@"mDidBecomeActive");
	if (pIsKeyboardShowing) {
		[self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - pKeyboardFrame.size.height)];
		[self.view layoutIfNeeded];
	}
}

-(void) mWillResignActive {

	NSLog(@"mWillResignActive");
}

@end

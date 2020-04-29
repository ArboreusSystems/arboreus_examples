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


// --------------------------------------
#pragma mark - Init

-(instancetype) init {

	NSLog(@"init");

	self = [super init];
	if (self) {
		
		[self setTitle:@"Main"];
		[self.view setBackgroundColor:__COLOR_GREEN];
		
		pIsKeyboardShowing = NO;
		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mKeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mKeyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mKeyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mKeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mWillResignActive) name:UIApplicationWillResignActiveNotification object:nil];

		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mDeviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
	}
	return self;
}

-(void) dealloc {
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}


// --------------------------------------
#pragma mark - Lifecycle

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
	[_pScrollView setBackgroundColor:__COLOR_PURPLE];
}

-(void) viewDidLoad {

	[super viewDidLoad];
	
	[self.view addSubview:_pScrollView];
	[_pScrollView addSubview:_pStackView];
	[_pScrollView setContentSize:_pStackView.bounds.size];
}

-(void) viewDidLayoutSubviews {

	[super viewDidLayoutSubviews];
	
	[[_pScrollView.topAnchor constraintEqualToAnchor:super.pContent.topAnchor] setActive:YES];
	[[_pScrollView.bottomAnchor constraintEqualToAnchor:super.pContent.bottomAnchor] setActive:YES];
	[[_pScrollView.leadingAnchor constraintEqualToAnchor:super.pContent.leadingAnchor] setActive:YES];
	[[_pScrollView.trailingAnchor constraintEqualToAnchor:super.pContent.trailingAnchor] setActive:YES];
	
	[[_pStackView.topAnchor constraintEqualToAnchor:_pScrollView.topAnchor] setActive:YES];
	[[_pStackView.bottomAnchor constraintEqualToAnchor:_pScrollView.bottomAnchor] setActive:YES];
	[[_pStackView.leadingAnchor constraintEqualToAnchor:_pScrollView.leadingAnchor] setActive:YES];
	[[_pStackView.trailingAnchor constraintEqualToAnchor:_pScrollView.trailingAnchor] setActive:YES];
	[[_pStackView.widthAnchor constraintEqualToAnchor:_pScrollView.widthAnchor] setActive:YES];
}

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {

	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
	NSLog(@"viewWillTransitionToSize Self View %f:%f",size.width,size.height);
	
	CGRect oScreenFrame = [[UIScreen mainScreen] bounds];
	NSLog(@"viewWillTransitionToSize Screen %f:%f",oScreenFrame.size.width,oScreenFrame.size.height);
}


// --------------------------------------
#pragma mark - UI Actions

-(void) mActionButtonOk {

	NSLog(@"mActionButtonOk");
}


// --------------------------------------
#pragma mark - UITextFieldDelegate

-(BOOL) textFieldShouldReturn:(UITextField *)textField {

	NSLog(@"textFieldShouldReturn");
	
	[textField resignFirstResponder];
	return YES;
}


// --------------------------------------
#pragma mark - Notifications: Keyboard

-(void) mKeyboardWillChangeFrame:(NSNotification *)sender {
	
	CGRect oKeyboardRect = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
	NSLog(@"mKeyboardWillChangeFrame %f:%f",oKeyboardRect.size.width,oKeyboardRect.size.height);
}

-(void) mKeyboardDidChangeFrame:(NSNotification *)sender {
	
	CGRect oKeyboardRect = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
	NSLog(@"mKeyboardDidChangeFrame %f:%f",oKeyboardRect.size.width,oKeyboardRect.size.height);
	pKeyboardFrame = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
}

-(void) mKeyboardWillHide:(NSNotification *)sender {
	
	NSLog(@"mKeyboardWillHide");
}

-(void) mKeyboardDidHide:(NSNotification *)sender {
	
	NSLog(@"mKeyboardDidHide");
	if (pIsKeyboardShowing) {
		pIsKeyboardShowing = NO;
		[self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + pKeyboardFrame.size.height)];
		[self.view layoutIfNeeded];
	}
}

-(void) mKeyboardWillShow:(NSNotification *)sender {

	NSLog(@"mKeyboardWillShow");
}

-(void) mKeyboardDidShow:(NSNotification *)sender {

	NSLog(@"mKeyboardDidShow");
	if (!pIsKeyboardShowing) {
		pIsKeyboardShowing = YES;
		[self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - pKeyboardFrame.size.height)];
		[self.view layoutIfNeeded];
	}
}


// --------------------------------------
#pragma mark - Notifications: Application

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


// --------------------------------------
#pragma mark - Notifications: Orientation

-(void) mDeviceOrientationDidChange:(NSNotification *)sender {

	NSLog(@"mDeviceOrientationDidChange");
	[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	if (pIsKeyboardShowing) {
		pIsKeyboardShowing = NO;
		[self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + pKeyboardFrame.size.height)];
		[self.view layoutIfNeeded];
	}
}

@end

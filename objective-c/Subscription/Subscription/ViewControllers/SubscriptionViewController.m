//
//  SubscriptionViewController.m
//  Subscription
//
//  Created by Alexandr Kirilov on 2019-06-26.
//  Copyright © 2019 none. All rights reserved.
//

#import "SubscriptionViewController.h"

@implementation SubscriptionViewController


#pragma View initialiser

-(instancetype) init {

	self = [super init];
	if (self) {
		self.view.backgroundColor = [UIColor whiteColor];
	}
	return self;
}

-(void) viewDidLoad {

    [super viewDidLoad];

	_pScreenWidth = CGRectGetWidth(self.view.bounds);
	_pScreenHeight = CGRectGetHeight(self.view.bounds);
	_pElementsWidth = _pScreenWidth * 0.8;
	_pElementsHeight = _pScreenWidth * 0.15;

	_pSubscription = [[Subscription alloc] init];

	[self.view addSubview:[self mButtonExit]];
	[self.view addSubview:[self
		mCreateLabel: _pScreenHeight * 0.1 inTitle:@"Objective-C example"
	]];
	[self.view addSubview:[self
		mCreateLabel: _pScreenHeight * 0.15 inTitle:@"Auto-renewable subscription"
	]];
	[self mViewSubscribe:@"Subscribe"];
}


#pragma UI Elements

-(UIButton *) mButtonExit {

	UIButton *oButtonExit = [self mCreateButton:_pScreenHeight * 0.8];
	oButtonExit.backgroundColor = [UIColor
		colorWithRed: 84.0/255.0 green: 26.0/255.0
		blue: 218.0/255.0 alpha:1
	];
	[oButtonExit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[oButtonExit setTitle:@"Exit" forState:UIControlStateNormal];
	[oButtonExit addTarget:self action:@selector(mDoExit) forControlEvents:UIControlEventTouchUpInside];
	return oButtonExit;
}


#pragma Subscription View elements

-(void) mViewCanNotPay {

	UILabel *oViewCanNotPay = [[UILabel alloc] initWithFrame:[self mCreateSubscriptionCGRect]];
	oViewCanNotPay.backgroundColor = [UIColor
		colorWithRed: 234.0 / 255.0 green: 0.0 / 255.0
		blue: 66.0 / 255.0 alpha:1
	];
	oViewCanNotPay.textColor = [UIColor whiteColor];
	oViewCanNotPay.text = @"You can not pay";
	oViewCanNotPay.textAlignment = NSTextAlignmentCenter;
	if (_pSubscriptionView != nil) {
		_pSubscriptionView = nil;
	}
	_pSubscriptionView = oViewCanNotPay;
	[self.view addSubview:_pSubscriptionView];
}

-(void)mViewInProgress {

	UILabel *oViewInProgress = [[UILabel alloc] initWithFrame:[self mCreateSubscriptionCGRect]];
	oViewInProgress.backgroundColor = [UIColor grayColor];
	oViewInProgress.textColor = [UIColor whiteColor];
	oViewInProgress.text = @"In progress";
	oViewInProgress.textAlignment = NSTextAlignmentCenter;
	if (_pSubscriptionView != nil) {
		_pSubscriptionView = nil;
	}
	_pSubscriptionView = oViewInProgress;
	[self.view addSubview:_pSubscriptionView];
}

-(void)mViewSubscribe: (NSString *) inTitle {

	UIButton *oButtonSubscribe = [[UIButton alloc] initWithFrame:[self mCreateSubscriptionCGRect]];
	oButtonSubscribe.backgroundColor = [UIColor
		colorWithRed: 2.0 / 255.0 green: 83.0 / 255.0
		blue: 206.0 / 255.0 alpha:1
	];
	[oButtonSubscribe setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[oButtonSubscribe setTitle:inTitle forState:UIControlStateNormal];
	[oButtonSubscribe addTarget:self action:@selector(mDoSubscribe) forControlEvents:UIControlEventTouchUpInside];
	if (_pSubscriptionView != nil) {
		_pSubscriptionView = nil;
	}
	_pSubscriptionView = oButtonSubscribe;
	[self.view addSubview:_pSubscriptionView];
}

-(void) mViewSubscribed: (NSString *) inText {

	UILabel *oViewSubscribed = [[UILabel alloc] initWithFrame:[self mCreateSubscriptionCGRect]];
	oViewSubscribed.backgroundColor = [UIColor
		colorWithRed: 10.0 / 255.0 green: 141.0 / 255.0
		blue: 23.0 / 255.0 alpha:1
	];
	oViewSubscribed.textColor = [UIColor whiteColor];
	oViewSubscribed.text = inText;
	oViewSubscribed.textAlignment = NSTextAlignmentCenter;
	if (_pSubscriptionView != nil) {
		_pSubscriptionView = nil;
	}
	_pSubscriptionView = oViewSubscribed;
	[self.view addSubview:_pSubscriptionView];
}


#pragma UI Elements primitives

-(UIButton *) mCreateButton: (CGFloat) inY {

	return [[UIButton alloc] initWithFrame:[self
		mCreateCGRect:inY inHeight:_pElementsHeight
	]];
}

-(UILabel *) mCreateLabel: (CGFloat) inY inTitle: (NSString *) inTitle {

	UILabel *oLabel = [[UILabel alloc] initWithFrame:[self
		mCreateCGRect:inY inHeight:_pElementsHeight
	]];
	oLabel.text = inTitle;
	oLabel.textAlignment = NSTextAlignmentCenter;
	return oLabel;
}

-(CGRect) mCreateCGRect: (CGFloat) inY inHeight: (CGFloat) inHeight {

	return CGRectMake(
		(_pScreenWidth - _pElementsWidth) / 2,inY,
		_pElementsWidth,inHeight
	);
}

-(CGRect) mCreateSubscriptionCGRect {

	return CGRectMake(
		(_pScreenWidth - _pElementsWidth) / 2,
		_pScreenHeight * 0.3,
		_pElementsWidth,
		_pScreenHeight * 0.2
	);
}


#pragma UI Actions

-(void) mDoExit {

	[Handler mDoExit];
}

-(void) mDoSubscribe {

	[_pSubscription mSubscribe];
}

@end

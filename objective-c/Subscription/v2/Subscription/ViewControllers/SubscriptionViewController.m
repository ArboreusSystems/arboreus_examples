//
//  SubscriptionViewController.m
//  Subscription
//
//  Created by Alexandr Kirilov on 27/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "SubscriptionViewController.h"

@implementation SubscriptionViewController


#pragma mark Object init

-(instancetype) init {

	self = [super init];
	if (self) {
		self.view.backgroundColor = [UIColor whiteColor];
		_pSubscription = [[SubscriptionHandler alloc] initWithView:self];
	}
	return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];
	
    _pScreenWidth = CGRectGetWidth(self.view.bounds);
	_pScreenHeight = CGRectGetHeight(self.view.bounds);
	_pElementsWidth = _pScreenWidth * 0.8;
	_pElementsHeight = _pScreenWidth * 0.15;
	
	[self mButtonExit];
	[self mLabelLanguage];
	[self mLabelApplication];
}


#pragma mark Subscription View Protocol

-(void) mViewInProgress {

	UILabel *oLabel = [[UILabel alloc] initWithFrame:[self mCreateRectSubscription]];
	oLabel.text = @"In progress";
	oLabel.textAlignment = NSTextAlignmentCenter;
	oLabel.backgroundColor = [UIColor lightGrayColor];
	oLabel.textColor = [UIColor whiteColor];
	if (_pSubscriptionView != nil) {
		[_pSubscriptionView removeFromSuperview];
		_pSubscriptionView = nil;
	}
	_pSubscriptionView = oLabel;
	[self.view addSubview:_pSubscriptionView];
}

-(void) mViewSubscribed: (NSString *) inText {

	UILabel *oLabel = [[UILabel alloc] initWithFrame:[self mCreateRectSubscription]];
	oLabel.text = @"Subscribed";
	oLabel.textAlignment = NSTextAlignmentCenter;
	oLabel.backgroundColor = [UIColor
		colorWithRed: 10.0 / 255.0 green: 141.0 / 255.0
		blue: 23.0 / 255.0 alpha:1
	];
	oLabel.textColor = [UIColor whiteColor];
	if (_pSubscriptionView != nil) {
		[_pSubscriptionView removeFromSuperview];
		_pSubscriptionView = nil;
	}
	_pSubscriptionView = oLabel;
	[self.view addSubview:_pSubscriptionView];
}

-(void) mViewSubscribe: (NSString *) inTitle {

	UIButton *oButton = [[UIButton alloc] initWithFrame:[self mCreateRectSubscription]];
	oButton.backgroundColor = [UIColor
		colorWithRed: 2.0 / 255.0 green: 83.0 / 255.0
		blue: 206.0 / 255.0 alpha:1
	];
	[oButton setTitle:inTitle forState:UIControlStateNormal];
	[oButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[oButton addTarget:self action:@selector(mDoSubscribe) forControlEvents:UIControlEventTouchUpInside];
	if (_pSubscriptionView != nil) {
		[_pSubscriptionView removeFromSuperview];
		_pSubscriptionView = nil;
	}
	_pSubscriptionView = oButton;
	[self.view addSubview:_pSubscriptionView];
}

-(void) mViewCanNotSubscribe: (NSString *) inTitle {

	UILabel *oLabel = [[UILabel alloc] initWithFrame:[self mCreateRectSubscription]];
	oLabel.text = inTitle;
	oLabel.textAlignment = NSTextAlignmentCenter;
	oLabel.backgroundColor = [UIColor
		colorWithRed: 234.0 / 255.0 green: 0.0 / 255.0
		blue: 66.0 / 255.0 alpha: 1
	];
	oLabel.textColor = [UIColor whiteColor];
	if (_pSubscriptionView != nil) {
		[_pSubscriptionView removeFromSuperview];
		_pSubscriptionView = nil;
	}
	_pSubscriptionView = oLabel;
	[self.view addSubview:_pSubscriptionView];
}


#pragma mark UI Elements

-(void) mButtonExit {
	
	UIButton *oButtonExit = [self mCreateButton:0.85 inHeight:0.1];
	oButtonExit.backgroundColor = [UIColor
		colorWithRed: 84.0/255.0 green: 26.0/255.0
		blue: 218.0/255.0 alpha:1
	];
	[oButtonExit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[oButtonExit setTitle:@"Exit" forState:UIControlStateNormal];
	[oButtonExit addTarget:self action:@selector(mDoExit) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:oButtonExit];
}

-(void) mLabelLanguage {

	[self.view addSubview:[self	mCreateLabel:0.1 inText:@"Objective-C Examples"]];
}

-(void) mLabelApplication {

	[self.view addSubview:[self	mCreateLabel:0.15 inText:@"Auto-renewable Subscription"]];
}


#pragma mark UI Elemnts primitives

-(UIButton *) mCreateButton: (CGFloat) inY inHeight:(CGFloat) inHeight {
	
	UIButton *oButton = [[UIButton alloc] initWithFrame:[self mCreateRect:inY inHeight:inHeight]];
	return oButton;
}

-(UILabel *) mCreateLabel: (CGFloat) inY inText:(NSString *) inText {
	
	UILabel *oLabel = [[UILabel alloc] initWithFrame:[self mCreateRect:inY inHeight:0.1]];
	oLabel.text = inText;
	oLabel.textAlignment = NSTextAlignmentCenter;
	return oLabel;
}

-(CGRect) mCreateRect: (CGFloat) inY inHeight:(CGFloat) inHeight {

	return CGRectMake(
		(_pScreenWidth - _pElementsWidth) / 2, _pScreenHeight * inY,
		_pElementsWidth, _pScreenHeight * inHeight
	);
}

-(CGRect) mCreateRectSubscription {

	return [self mCreateRect:0.3 inHeight:0.2];
}


#pragma mark UI Elements Actions

-(void) mDoExit {

	[_pSubscription.pDefaultPaymentQueue removeTransactionObserver:_pSubscription];
	[MainHandler mDoExit];
}

-(void) mDoSubscribe {

	[_pSubscription mSubscribe];
}

@end

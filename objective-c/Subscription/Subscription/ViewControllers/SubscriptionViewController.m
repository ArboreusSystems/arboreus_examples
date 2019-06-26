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

	[self.view addSubview:[self mButtonExit]];
	[self.view addSubview:[self
		mCreateLabel: _pScreenHeight * 0.1 inTitle:@"Objective-C example"
	]];
	[self.view addSubview:[self
		mCreateLabel: _pScreenHeight * 0.15 inTitle:@"Auto-renewable subscription"
	]];
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


#pragma UI Actions

-(void) mDoExit {

	[Handler mDoExit];
}

@end

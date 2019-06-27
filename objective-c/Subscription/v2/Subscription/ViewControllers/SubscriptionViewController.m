//
//  SubscriptionViewController.m
//  Subscription
//
//  Created by Alexandr Kirilov on 27/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "SubscriptionViewController.h"

@interface SubscriptionViewController ()

@end

@implementation SubscriptionViewController


#pragma Object init

-(instancetype) init {

	self = [super init];
	if (self) {
		self.view.backgroundColor = [UIColor whiteColor];
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
}


#pragma UI Elements

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


#pragma UI Elemnts primitives

-(UIButton *) mCreateButton: (CGFloat) inY inHeight:(CGFloat) inHeight {
	
	UIButton *oButton = [[UIButton alloc] initWithFrame:[self mCreateRect:inY inHeight:inHeight]];
	return oButton;
}

-(UILabel *) mCreateLabel: (CGFloat) inY inText:(NSString *) inText {
	
	UILabel *oLabel = [[UILabel alloc] initWithFrame:[self mCreateRect:inY inHeight:0.1]];
	oLabel.text = inText;
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


#pragma UI Elements Actions

-(void) mDoExit {

	[MainHandler mDoExit];
}

@end

//
//  MainViewController.m
//  Constrain
//
//  Created by Alexandr Kirilov on 2019-06-25.
//  Copyright © 2019 none. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()



@end

@implementation MainViewController

-(instancetype) init {

    self = [super init];
    if (self) {
		self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void) viewDidLoad {

    [super viewDidLoad];
	
    UInt8 oPadding = 30;
    UInt8 oElementHeight = 50;
	
	UIButton *oButtonExit = [self mButtonExit];
	[self.view addSubview:oButtonExit];
	[NSLayoutConstraint constraintWithItem:oButtonExit
		attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view
		attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0
	].active = YES;
	[NSLayoutConstraint constraintWithItem:oButtonExit
		attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view
		attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-oPadding
	].active = YES;
	[NSLayoutConstraint constraintWithItem:oButtonExit
		attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view
		attribute:NSLayoutAttributeLeft multiplier:1.0 constant:oPadding
	].active = YES;
	[NSLayoutConstraint constraintWithItem:oButtonExit
		attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view
		attribute:NSLayoutAttributeRight multiplier:1.0 constant:-oPadding
	].active = YES;
	[NSLayoutConstraint constraintWithItem:oButtonExit
		attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:oButtonExit
		attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-oElementHeight
	].active = YES;
	
	UILabel *oLabelLanguage = [self mLabelLanguage];
	[self.view addSubview:oLabelLanguage];
	[NSLayoutConstraint constraintWithItem:oLabelLanguage
		attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view
		attribute:NSLayoutAttributeTop multiplier:1.0 constant:2.5 * oPadding
	].active = YES;
	[NSLayoutConstraint constraintWithItem:oLabelLanguage
		attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view
		attribute:NSLayoutAttributeLeft multiplier:1.0 constant:oPadding
	].active = YES;
	[NSLayoutConstraint constraintWithItem:oLabelLanguage
		attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view
		attribute:NSLayoutAttributeRight multiplier:1.0 constant:-oPadding
	].active = YES;
	[NSLayoutConstraint constraintWithItem:oLabelLanguage
		attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:oLabelLanguage
		attribute:NSLayoutAttributeTop multiplier:1.0 constant:oElementHeight
	].active = YES;
	
	UILabel *oLabelApplication = [self mLabelApplication];
	[self.view addSubview:oLabelApplication];
	[NSLayoutConstraint constraintWithItem:oLabelApplication
		attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:oLabelLanguage
		attribute:NSLayoutAttributeTop multiplier:1.0 constant:oPadding
	].active = YES;
	[NSLayoutConstraint constraintWithItem:oLabelApplication
		attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view
		attribute:NSLayoutAttributeLeft multiplier:1.0 constant:oPadding
	].active = YES;
	[NSLayoutConstraint constraintWithItem:oLabelApplication
		attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view
		attribute:NSLayoutAttributeRight multiplier:1.0 constant:-oPadding
	].active = YES;
	[NSLayoutConstraint constraintWithItem:oLabelApplication
		attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:oLabelApplication
		attribute:NSLayoutAttributeTop multiplier:1.0 constant:oElementHeight
	].active = YES;
}


#pragma mark UI Elements

-(UIButton *) mButtonExit {

    UIButton *oButtonExit = [self mCreateButton:@"Exit" inFrame:CGRectMake(0,0,0,0)];
	oButtonExit.backgroundColor = [UIColor
		colorWithRed: 0.0 / 255.0 green: 62.0 / 255.0
		blue: 175.0 / 255.0 alpha: 1
	];
	[oButtonExit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[oButtonExit addTarget:self action:@selector(mActionButtonExit) forControlEvents:UIControlEventTouchUpInside];
	oButtonExit.translatesAutoresizingMaskIntoConstraints = NO;
	return oButtonExit;
}

-(UILabel *) mLabelLanguage {

	UILabel *oLabelLanguage = [self mCreateLabel:@"Objective-C Examples" inFrame:CGRectMake(100, 100, 200, 20)];
	[oLabelLanguage setTextColor:[UIColor blackColor]];
	[oLabelLanguage setTextAlignment:NSTextAlignmentCenter];
	oLabelLanguage.translatesAutoresizingMaskIntoConstraints = NO;
	return oLabelLanguage;
}

-(UILabel *) mLabelApplication {

	UILabel *oLabelApplication = [self mCreateLabel:@"Constrains Usage" inFrame:CGRectMake(100, 150, 250, 20)];
	[oLabelApplication setTextColor:[UIColor blackColor]];
	[oLabelApplication setTextAlignment:NSTextAlignmentCenter];
	oLabelApplication.translatesAutoresizingMaskIntoConstraints = NO;
	return oLabelApplication;
}


#pragma mark UI Element primitives

-(UIButton *) mCreateButton: (NSString *)inTitle inFrame:(CGRect)inFrame {

    UIButton *oButton = [[UIButton alloc] initWithFrame:inFrame];
    [oButton setTitle:inTitle forState:UIControlStateNormal];
    return oButton;
}

-(UILabel *) mCreateLabel: (NSString *)inText inFrame:(CGRect)inFrame {

	UILabel *oLabel = [[UILabel alloc] initWithFrame:inFrame];
	oLabel.text = inText;
	return oLabel;
}


#pragma mark Button Actions

-(void) mActionButtonExit {

	[Handler mDoExit];
}

@end

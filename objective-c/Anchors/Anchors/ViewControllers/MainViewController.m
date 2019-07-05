//
//  MainViewController.m
//  Anchors
//
//  Created by Alexandr Kirilov on 05/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void) loadView {

	[super loadView];
	self.view.backgroundColor = [UIColor whiteColor];
}

-(void) viewDidLoad {

    [super viewDidLoad];
	
	CGFloat oPadding = 30;
	CGFloat oElementSize = 45;
	
    UIButton *oButtonExit = [self mButtonExit];
    [self.view addSubview:oButtonExit];
    [oButtonExit.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [oButtonExit.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:oPadding].active = YES;
    [oButtonExit.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-oPadding].active = YES;
    [oButtonExit.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-oPadding].active = YES;
    [oButtonExit.topAnchor constraintEqualToAnchor:oButtonExit.bottomAnchor constant:-oElementSize].active = YES;
	
    UILabel *oLableLanguage = [self mLabelLanguage];
    [self.view addSubview:oLableLanguage];
    [oLableLanguage.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [oLableLanguage.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:2 * oPadding].active = YES;
    [oLableLanguage.bottomAnchor constraintEqualToAnchor:oLableLanguage.topAnchor constant:oElementSize].active = YES;
    [oLableLanguage.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:oPadding].active = YES;
    [oLableLanguage.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-oPadding].active = YES;
	
    UILabel *oLableApplication = [self mLabelApplication];
    [self.view addSubview:oLableApplication];
    [oLableApplication.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [oLableApplication.topAnchor constraintEqualToAnchor:oLableLanguage.bottomAnchor constant:oPadding / 4].active = YES;
    [oLableApplication.bottomAnchor constraintEqualToAnchor:oLableApplication.topAnchor constant:oElementSize].active = YES;
    [oLableApplication.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:oPadding].active = YES;
    [oLableApplication.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-oPadding].active = YES;
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

	UILabel *oLabelLanguage = [self mCreateLabel:@"Objective-C Examples" inFrame:CGRectMake(0,0,0,0)];
	[oLabelLanguage setTextColor:[UIColor blackColor]];
	[oLabelLanguage setTextAlignment:NSTextAlignmentCenter];
	oLabelLanguage.translatesAutoresizingMaskIntoConstraints = NO;
	return oLabelLanguage;
}

-(UILabel *) mLabelApplication {

	UILabel *oLabelApplication = [self mCreateLabel:@"Anchors " inFrame:CGRectMake(0,0,0,0)];
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

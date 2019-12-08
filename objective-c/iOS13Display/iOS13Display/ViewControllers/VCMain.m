//
//  VCMain.m
//  iOS13Display
//
//  Created by Alexandr Kirilov on 08/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

#import "VCMain.h"

@interface VCMain ()

@property (strong,nonatomic) UIButton *pButtonExit;
@property (strong,nonatomic) UILabel *pLabelLanguage;
@property (strong,nonatomic) UILabel *pLabelNotice;
@property CGFloat pScreenWidth;
@property CGFloat pScreenHeight;

@end

@implementation VCMain

-(void) loadView {
	
	[super loadView];
	self.view.backgroundColor = _COLOR_WHITE;
}

-(void) viewDidLoad {
	
    [super viewDidLoad];
	_pScreenWidth = CGRectGetWidth(self.view.bounds);
	_pScreenHeight = CGRectGetHeight(self.view.bounds);
	
	[self mCreateButtonExit];
	[self mCreateLabelLanguage];
	[self mCreateLabelNotice];
}


#pragma mark UI Elements

-(void) mCreateButtonExit {

	_pButtonExit = [[UIButton alloc] init];
	_pButtonExit.backgroundColor = _COLOR_BLUE_DARK;
	[_pButtonExit setTitleColor:_COLOR_WHITE_CLEAN forState:UIControlStateNormal];
	[_pButtonExit setTitle:@"Exit" forState:UIControlStateNormal];
	[_pButtonExit addTarget:self action:@selector(mDoExit) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_pButtonExit];
	_pButtonExit.translatesAutoresizingMaskIntoConstraints = NO;
	[_pButtonExit.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-_pScreenHeight * 0.05].active = YES;
	[_pButtonExit.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
	[_pButtonExit.widthAnchor constraintEqualToConstant:_pScreenWidth * 0.8].active = YES;
	[_pButtonExit.heightAnchor constraintEqualToConstant:_pScreenHeight * 0.075].active = YES;
}

-(void) mCreateLabelLanguage {

	_pLabelLanguage = [[UILabel alloc] init];
	_pLabelLanguage.text = @"Objective-C Examples";
	_pLabelLanguage.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:_pLabelLanguage];
	_pLabelLanguage.translatesAutoresizingMaskIntoConstraints = NO;
	[_pLabelLanguage.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
	[_pLabelLanguage.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:_pScreenHeight * 0.05].active = YES;
	[_pLabelLanguage.heightAnchor constraintEqualToConstant:_pScreenHeight * 0.05].active = YES;
}

-(void) mCreateLabelNotice {
	
	_pLabelNotice = [[UILabel alloc] init];
	_pLabelNotice.text = @"Disable DarkMode and Invert colors";
	_pLabelNotice.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:_pLabelNotice];
	_pLabelNotice.translatesAutoresizingMaskIntoConstraints = NO;
	[_pLabelNotice.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
	[_pLabelNotice.topAnchor constraintEqualToAnchor:_pLabelLanguage.bottomAnchor].active = YES;
	[_pLabelNotice.heightAnchor constraintEqualToConstant:_pScreenHeight * 0.05].active = YES;
}


#pragma mark UI Elements Actions

-(void) mDoExit {

	[HMain mDoExit];
}

@end

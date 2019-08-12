//
//  VCMain.m
//  UIStackView
//
//  Created by Alexandr Kirilov on 11/08/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

#import "VCMain.h"

@interface VCMain ()

@property (strong,nonatomic) UIStackView *pStackView;

@property (strong,nonatomic) UIButton *pButtonExit;
@property (strong,nonatomic) UILabel *pLabelLanguage;
@property (strong,nonatomic) UILabel *pLabelNotice;

@property CGFloat pScreenWidth;
@property CGFloat pScreenHeight;

@end

@implementation VCMain

-(instancetype) init {
	
	self = [super init];
	if (self) {
		self.view.backgroundColor = _COLOR_WHITE;
	}
	return self;
}

-(void) viewDidLoad {

	[super viewDidLoad];
	
	_pScreenWidth = CGRectGetWidth(self.view.bounds);
	_pScreenHeight = CGRectGetHeight(self.view.bounds);
	
	[self mCreateButtonExit];
	[self mCreateLabelLanguage];
	[self mCreateLabelNotice];
	
	[self mCreateStackView];
}


#pragma mark UIStackView

-(void) mCreateStackView {

	_pStackView = [[UIStackView alloc] initWithArrangedSubviews:@[
		[self mCreateStackElement],	[self mCreateStackElement],
		[self mCreateStackElement],	[self mCreateStackElement],
		[self mCreateStackElement],	[self mCreateStackElement],
	]];
	_pStackView.spacing = 5;
	[self.view addSubview:_pStackView];
	_pStackView.translatesAutoresizingMaskIntoConstraints = NO;
	[_pStackView.topAnchor constraintEqualToAnchor:_pLabelNotice.bottomAnchor constant:_pScreenHeight * 0.05].active = YES;
	[_pStackView.bottomAnchor constraintEqualToAnchor:_pButtonExit.topAnchor constant:-_pScreenHeight * 0.05].active = YES;
	[_pStackView.widthAnchor constraintEqualToConstant:_pScreenWidth * 0.8].active = YES;
	[_pStackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
}

-(UIView *) mCreateStackElement {
	
	UIView *oView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
	oView.backgroundColor = [HMain mCreateRandomColor];
	oView.translatesAutoresizingMaskIntoConstraints = NO;
	[oView.widthAnchor constraintEqualToConstant:30].active = YES;
	return oView;
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
	_pLabelNotice.text = @"UIStackView";
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

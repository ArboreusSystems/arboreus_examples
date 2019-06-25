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
	[self.view addSubview:[self mButtonExit]];
	[self.view addSubview:[self mLabelLanguage]];
	[self.view addSubview:[self mLabelApplication]];
	[self.view addSubview:[[Square alloc] initWithFrame:CGRectMake(100, 100, 10, 10)]];
}


#pragma UI Elements

-(UIButton *) mButtonExit {

    UIButton *oButtonExit = [self mCreateButton:@"Exit" inFrame:CGRectMake(50,50,50,50)];
	oButtonExit.backgroundColor = [UIColor
		colorWithRed: 0.0 / 255.0 green: 62.0 / 255.0
		blue: 175.0 / 255.0 alpha: 1
	];
	[oButtonExit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[oButtonExit addTarget:self action:@selector(mActionButtonExit) forControlEvents:UIControlEventTouchUpInside];
	return oButtonExit;
}

-(UILabel *) mLabelLanguage {

	UILabel *oLabelLanguage = [self mCreateLabel:@"Objective-C Examples" inFrame:CGRectMake(100, 100, 200, 20)];
	[oLabelLanguage setTextColor:[UIColor blackColor]];
	[oLabelLanguage setTextAlignment:NSTextAlignmentCenter];
	return oLabelLanguage;
}

-(UILabel *) mLabelApplication {

	UILabel *oLabelApplication = [self mCreateLabel:@"Constrains Usage" inFrame:CGRectMake(100, 150, 250, 20)];
	[oLabelApplication setTextColor:[UIColor blackColor]];
	[oLabelApplication setTextAlignment:NSTextAlignmentCenter];
	return oLabelApplication;
}


#pragma UI Element primitives

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


#pragma Button Actions

-(void) mActionButtonExit {

	[Handler mDoExit];
}

@end

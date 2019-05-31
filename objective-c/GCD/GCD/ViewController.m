//
//  ViewController.m
//  GCD
//
//  Created by Alexandr Kirilov on 31/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	float vColorRed = 223.0/255.0;
	float vColorGreen = 239.0/255.0;
	float vColorBlue = 240.0/255.0;
	
    self.view.backgroundColor = [UIColor
		colorWithDisplayP3Red:vColorRed
		green:vColorGreen
		blue:vColorBlue
		alpha:1.0
	];
	
	self.pScreenWidth = CGRectGetWidth(self.view.bounds);
	self.pScreenHeight = CGRectGetHeight(self.view.bounds);
	
	[self mButtonExit];
	[self mLabelMessage];
}

-(void) mButtonExit {

	UIButton *oButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[oButton setBackgroundColor:[UIColor
		colorWithDisplayP3Red: 84.0/255.0
		green: 26.0/255.0
		blue: 218.0/255.0
		alpha:1.0
	]];
	CGFloat buttonWith = self.pScreenWidth * 0.8;
	CGFloat buttonHeight = self.pScreenWidth * 0.15;
	CGFloat buttonX = (self.pScreenWidth - buttonWith) / 2;
	CGFloat buttonY = self.pScreenHeight * 0.7;
	[oButton setFrame:CGRectMake(buttonX,buttonY,buttonWith,buttonHeight)];
	[oButton setTitle:@"Exit" forState:UIControlStateNormal];
	[oButton addTarget:self
		action:@selector(mButtonExitTouchUpInside:)
		forControlEvents:UIControlEventTouchUpInside
	];
	
	[self.view addSubview:oButton];
}

-(void) mButtonExitTouchUpInside:(id)sender {

	[[[Handler alloc] init] mDoExit];
}

-(void) mLabelMessage {

	CGFloat labelWith = self.pScreenWidth * 0.8;
	CGFloat labelHeight = self.pScreenWidth * 0.1;
	CGFloat labelX = (self.pScreenWidth - labelWith) / 2;
	CGFloat labelY = self.pScreenHeight * 0.3;
	UILabel *oLabel = [[UILabel alloc]
		initWithFrame:CGRectMake(labelX,labelY,labelWith,labelHeight)
	];
	oLabel.text = @"GCD Usage";
	oLabel.textAlignment = NSTextAlignmentCenter;

	[self.view addSubview:oLabel];
}

@end

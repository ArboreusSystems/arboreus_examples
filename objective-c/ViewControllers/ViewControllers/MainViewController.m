//
//  MainViewController.m
//  ViewControllers
//
//  Created by Alexandr Kirilov on 28/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    }
    return self;
}

-(void) loadView {
	
	[super loadView];
	NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

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
	NSLog(@"self.pScreenWidth: %f",self.pScreenWidth);
	self.pScreenHeight = CGRectGetHeight(self.view.bounds);
	NSLog(@"self.pScreenHeight: %f",self.pScreenHeight);
	
	[self mButtonExit];
	[self mButtonAuxiliaryController];
	[self mLabelMessage];
	
	NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

-(void) viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:YES];
	NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

-(void) viewDidAppear:(BOOL)animated {

	[super viewDidAppear:YES];
	NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

-(void) viewWillDisappear:(BOOL)animated {

	[super viewWillDisappear:YES];
	NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

-(void) viewDidDisappear:(BOOL)animated {

	[super viewDidDisappear:YES];
	NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

-(void) viewWillLayoutSubviews {

	[super viewWillLayoutSubviews];
	NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

-(void) viewDidLayoutSubviews {

	[super viewDidLayoutSubviews];
	NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

-(void) didReceiveMemoryWarning {

	[super didReceiveMemoryWarning];
	NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
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

-(void) mButtonAuxiliaryController {

	UIButton *oButton = [UIButton buttonWithType:UIButtonTypeCustom];
	CGFloat buttonWith = self.pScreenWidth * 0.8;
	CGFloat buttonHeight = self.pScreenWidth * 0.15;
	CGFloat buttonX = (self.pScreenWidth - buttonWith) / 2;
	CGFloat buttonY = self.pScreenHeight * 0.5;
	[oButton setFrame:CGRectMake(buttonX,buttonY,buttonWith,buttonHeight)];
	[oButton setTitle:@"Move to AuxiliaryViewController" forState:UIControlStateNormal];
	[oButton addTarget:self
		action:@selector(mButtonAuxiliaryControllerTouchUpInside:)
		forControlEvents:UIControlEventTouchUpInside
	];
	[oButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	
	[self.view addSubview:oButton];
}

-(void) mButtonAuxiliaryControllerTouchUpInside: (id)sender {

	AuxiliaryViewController *oAuxiliaryViewController = [
		[AuxiliaryViewController alloc] init];
	[self.navigationController
		pushViewController:oAuxiliaryViewController
		animated:YES
	];
}

-(void) mLabelMessage {

	CGFloat labelWith = self.pScreenWidth * 0.8;
	CGFloat labelHeight = self.pScreenWidth * 0.1;
	CGFloat labelX = (self.pScreenWidth - labelWith) / 2;
	CGFloat labelY = self.pScreenHeight * 0.3;
	UILabel *oLabel = [[UILabel alloc]
		initWithFrame:CGRectMake(labelX,labelY,labelWith,labelHeight)
	];
	oLabel.text = @"View Controllers Usage";
	oLabel.textAlignment = NSTextAlignmentCenter;

	[self.view addSubview:oLabel];
}

@end

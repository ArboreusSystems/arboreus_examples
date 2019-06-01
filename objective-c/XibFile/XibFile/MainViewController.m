//
//  MainViewController.m
//  XibFile
//
//  Created by Alexandr Kirilov on 28/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void) viewDidLoad {
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
}

-(IBAction) buttonExit:(id)sender {
	
	Handler *oHandler = [[Handler alloc] init];
	[oHandler mDoExit];
}

-(IBAction) buttonAuxiliaryViewController:(id)sender {
	
	AuxiliaryViewController *oAuxiliaryViewController = [
		[AuxiliaryViewController alloc]
		initWithNibName:@"AuxiliaryViewController"
		bundle:nil
	];
	[self.navigationController
		pushViewController:oAuxiliaryViewController
		animated:YES
	];
}

@end

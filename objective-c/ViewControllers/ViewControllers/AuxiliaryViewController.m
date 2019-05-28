//
//  AuxiliaryViewController.m
//  ViewControllers
//
//  Created by Alexandr Kirilov on 28/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AuxiliaryViewController.h"

@interface AuxiliaryViewController ()

@end

@implementation AuxiliaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    float vColorRed = 217.0/255.0;
	float vColorGreen = 240.0/255.0;
	float vColorBlue = 223.0/255.0;
	
    self.view.backgroundColor = [UIColor
    	colorWithDisplayP3Red:vColorRed
    	green:vColorGreen
    	blue:vColorBlue
    	alpha:1.0
    ];
}

@end

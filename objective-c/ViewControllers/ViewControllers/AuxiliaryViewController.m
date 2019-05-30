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

@end

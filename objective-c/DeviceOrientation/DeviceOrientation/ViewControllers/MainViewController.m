//
//  MainViewController.m
//  DeviceOrientation
//
//  Created by Alexandr Kirilov on 09.04.2021.
//  Copyright © 2021 Alexandr Kirilov. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void) loadView {
    
    [super loadView];
    [self.view setBackgroundColor:__COLOR_GREEN];
}

-(void) viewDidLoad {
    
    [super viewDidLoad];
    
    _pPbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_pPbutton addTarget:self action:@selector(mActionSetDeviceOrientation) forControlEvents:UIControlEventTouchUpInside];
    [_pPbutton setTitle:@"Change Orientation" forState:UIControlStateNormal];
    [_pPbutton setBackgroundColor:__COLOR_PURPLE];
    [_pPbutton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_pPbutton];
    [[_pPbutton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [[_pPbutton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[_pPbutton.widthAnchor constraintEqualToConstant:self.view.bounds.size.width * 0.8] setActive:YES];
    [[_pPbutton.heightAnchor constraintEqualToConstant:self.view.bounds.size.height * 0.15] setActive:YES];
}

-(void) mActionSetDeviceOrientation {
    
    NSLog(@"Button clicked");
    [[UIDevice currentDevice] setValue: [NSNumber numberWithInteger: UIInterfaceOrientationLandscapeLeft] forKey:@"orientation"];
}

@end

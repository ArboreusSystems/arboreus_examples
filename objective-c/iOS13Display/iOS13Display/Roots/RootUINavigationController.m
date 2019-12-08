//
//  RootUINavigationController.m
//  iOS13Display
//
//  Created by Alexandr Kirilov on 08/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

#import "RootUINavigationController.h"

@interface RootUINavigationController ()

-(void) mSetupView;

@end

@implementation RootUINavigationController

-(void) loadView {
	
	[super loadView];
	[self mSetupView];
}

-(void) viewDidLoad {
	
    [super viewDidLoad];
}

-(void) mSetupView {
	
	if (@available(iOS 11,*)) {
		self.view.accessibilityIgnoresInvertColors = YES;
		self.navigationController.view.accessibilityIgnoresInvertColors = YES;
	}
	if (@available(iOS 13,*)) {
		self.view.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
	}
}

@end

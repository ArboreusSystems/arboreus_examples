//
//  ARootViewController.m
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 29/11/2022.
//

#import "ARootNavigationController.h"

@interface ARootNavigationController ()

@end

@implementation ARootNavigationController

-(instancetype) init {
	
	self = [super init];
	if (self) {
		
	}
	return self;
}

-(void) loadView {
    
    [super loadView];
    [self.view setBackgroundColor:__COLOR_BLUE];
	
	[self.navigationBar setBarStyle:UIBarStyleBlack];
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
}

@end

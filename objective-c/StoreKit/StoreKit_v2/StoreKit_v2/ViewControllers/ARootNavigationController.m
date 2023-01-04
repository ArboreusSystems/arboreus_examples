//
//  ARootNavigationController.m
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
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


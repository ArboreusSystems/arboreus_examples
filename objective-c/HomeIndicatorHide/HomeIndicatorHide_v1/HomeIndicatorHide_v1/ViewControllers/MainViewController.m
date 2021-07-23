//
//  MainViewController.m
//  HomeIndicatorHide_v1
//
//  Created by Alexandr Kirilov on 23.07.2021.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (instancetype)init {
	
	self = [super init];
	if (self) {
		
		_pHideHomeIndicator = NO;
		
	}
	return self;
}

- (void)loadView {
	
	[super loadView];
	
	_pButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[_pButton addTarget:self action:@selector(mSetHomeIndicatorAutoHidden) forControlEvents:UIControlEventTouchUpInside];
	[_pButton setFrame:CGRectMake(0, 0, 200, 50)];
	[_pButton setBackgroundColor:__COLOR_PURPLE];
	[_pButton setCenter:self.view.center];
	
	[self mSetButtonTitle];
	
	[self.view addSubview:_pButton];
	
}

- (void)viewDidLoad {
    
	[super viewDidLoad];
	[self.view setBackgroundColor:__COLOR_WHITE];
}

- (BOOL)prefersHomeIndicatorAutoHidden {
	
	return _pHideHomeIndicator;
}

- (void)mSetHomeIndicatorAutoHidden {
	
	if (_pHideHomeIndicator) {
		_pHideHomeIndicator = NO;
	} else {
		_pHideHomeIndicator = YES;
	}
	
	if (@available(iOS 11.0, *)) {
		[self setNeedsUpdateOfHomeIndicatorAutoHidden];
	}
	
	[self mSetButtonTitle];
}

- (void)mSetButtonTitle {
	
	if (_pHideHomeIndicator) {
		[_pButton setTitle:@"Show Home Indicator" forState:UIControlStateNormal];
	} else {
		[_pButton setTitle:@"Hide Home Indicator" forState:UIControlStateNormal];
	}
}

@end

//
//  DemoViewController.m
//  UIViewControllerLyfecycle
//
//  Created by Alexandr Kirilov on 13/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

@synthesize pName;
@synthesize pTestString1;

-(void) loadView {
	
	[super loadView];
	
	UIDeviceOrientation oDeviceOrientation = [[UIDevice currentDevice] orientation];
	NSLog(@"Device orientation loadView: %ld",(long)oDeviceOrientation);
	
	pName = @"3 >> DemoViewController";
	NSLog(@"%@ -> loadView",pName);
	
	pTestString1 = super.pTestString1;
	NSLog(@"%@ -> loadView :: super.pTestString1 = %@",pName,super.pTestString1);
	NSLog(@"%@ -> loadView :: pTestString1 = %@",pName,pTestString1);
	NSLog(@"%@ -> loadView :: super.pTestString2 = %@",pName,super.pTestString2);
	
	_pTestView = [[UIView alloc] init];
	[_pTestView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_pTestView setBackgroundColor:_COLOR_WHITE];
	[self.view addSubview:_pTestView];
	
	[self mTestMethod1];
	[self mTestMethod2];
	
	[self.view setBackgroundColor:_COLOR_PURPLE_LIGHT];
}

-(void) loadViewIfNeeded {
	
	[super loadView];
	NSLog(@"%@ -> loadViewIfNeeded",pName);
	
	UIDeviceOrientation oDeviceOrientation = [[UIDevice currentDevice] orientation];
	NSLog(@"Device orientation loadViewIfNeeded: %ld",(long)oDeviceOrientation);
}

-(void) viewDidLoad {
	
	[super viewDidLoad];
	NSLog(@"%@ -> viewDidLoad",pName);
	
	UIDeviceOrientation oDeviceOrientation = [[UIDevice currentDevice] orientation];
	NSLog(@"Device orientation viewDidLoad: %ld",(long)oDeviceOrientation);
}

-(void) viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	NSLog(@"%@ -> viewWillAppear",pName);
	
	UIDeviceOrientation oDeviceOrientation = [[UIDevice currentDevice] orientation];
	NSLog(@"Device orientation viewWillAppear: %ld",(long)oDeviceOrientation);
}

-(void) viewWillLayoutSubviews {
	
	[super viewWillLayoutSubviews];
	NSLog(@"%@ -> viewWillLayoutSubviews",pName);
	
	UIDeviceOrientation oDeviceOrientation = [[UIDevice currentDevice] orientation];
	NSLog(@"Device orientation viewWillLayoutSubviews: %ld",(long)oDeviceOrientation);
}

-(void) viewDidLayoutSubviews {

	[super viewDidLayoutSubviews];
	NSLog(@"%@ -> viewDidLayoutSubviews",pName);
	
	UIDeviceOrientation oDeviceOrientation = [[UIDevice currentDevice] orientation];
	NSLog(@"Device orientation viewDidLoad: %ld",(long)oDeviceOrientation);

	switch ([[UIDevice currentDevice] orientation]) {
  		case UIDeviceOrientationPortrait:
    		[self mLayoutPortrait];
    		break;
    	case UIDeviceOrientationPortraitUpsideDown:
    		[self mLayoutPortraitUpsideDown];
    		break;
    	case UIDeviceOrientationLandscapeLeft:
    		[self mLayoutLandscapeLeft];
    		break;
		case UIDeviceOrientationLandscapeRight:
			[self mLayoutLandscapeRight];
			break;
    	default:
    		[self mLayoutUndefined];
    		break;
	}
}

-(void) mLayoutPortrait {

	NSLog(@"mLayoutPortrait");
	
	[_pTestView removeConstraints:_pTestView.constraints];
	[_pTestView removeFromSuperview];
	[self.view addSubview:_pTestView];
	[[_pTestView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pTestView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[_pTestView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	[[_pTestView.heightAnchor constraintEqualToConstant:200.0] setActive:YES];
}

-(void) mLayoutPortraitUpsideDown {

	NSLog(@"mLayoutPortraitUpsideDown");
	
	[_pTestView removeConstraints:_pTestView.constraints];
	[_pTestView removeFromSuperview];
	[self.view addSubview:_pTestView];
	[[_pTestView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pTestView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[_pTestView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	[[_pTestView.heightAnchor constraintEqualToConstant:200.0] setActive:YES];
}

-(void) mLayoutLandscapeLeft {

	NSLog(@"mLayoutLandscapeLeft");
	
	[_pTestView removeConstraints:_pTestView.constraints];
	[_pTestView removeFromSuperview];
	[self.view addSubview:_pTestView];
	[[_pTestView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	[[_pTestView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pTestView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[_pTestView.widthAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.widthAnchor multiplier:0.5] setActive:YES];
}

-(void) mLayoutLandscapeRight {

	NSLog(@"mLayoutLandscapeRight");
	
	[_pTestView removeConstraints:_pTestView.constraints];
	[_pTestView removeFromSuperview];
	[self.view addSubview:_pTestView];
	[[_pTestView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
	[[_pTestView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pTestView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[_pTestView.widthAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.widthAnchor multiplier:0.5] setActive:YES];
}

-(void) mLayoutUndefined {

	NSLog(@"mLayoutUndefined");
}

-(void) viewDidAppear:(BOOL)animated {
	
	[super viewDidAppear:animated];
	NSLog(@"%@ -> viewDidAppear",pName);
	
	UIDeviceOrientation oDeviceOrientation = [[UIDevice currentDevice] orientation];
	NSLog(@"Device orientation viewDidAppear: %ld",(long)oDeviceOrientation);
}

-(void) viewWillDisappear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	NSLog(@"%@ -> viewWillAppear",pName);
	
	UIDeviceOrientation oDeviceOrientation = [[UIDevice currentDevice] orientation];
	NSLog(@"Device orientation viewWillDisappear: %ld",(long)oDeviceOrientation);
}

-(void) viewDidDisappear:(BOOL)animated {
	
	[super viewDidDisappear:animated];
	NSLog(@"%@ -> viewDidDisappear",pName);
	
	UIDeviceOrientation oDeviceOrientation = [[UIDevice currentDevice] orientation];
	NSLog(@"Device orientation viewDidDisappear: %ld",(long)oDeviceOrientation);
}

-(void) mTestMethod1 {

	[super mTestMethod1];
	NSLog(@"From %@::mTestMethod1",pName);
}

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {

	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

	NSLog(@"viewWillTransitionToSize");
	
	UIDeviceOrientation oDeviceOrientation = [[UIDevice currentDevice] orientation];
	NSLog(@"Device orientation: %ld",(long)oDeviceOrientation);
}

@end

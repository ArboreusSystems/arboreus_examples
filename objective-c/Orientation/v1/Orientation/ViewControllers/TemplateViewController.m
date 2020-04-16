//
//  TemplateViewController.m
//  Orientation
//
//  Created by Alexandr Kirilov on 15/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "TemplateViewController.h"

@interface TemplateViewController ()

@end

@implementation TemplateViewController

-(void) loadView {
	
	[super loadView];
	
	[[NSNotificationCenter defaultCenter]
		addObserver:self selector:@selector(mOnOrientationChanged:)
		name:UIDeviceOrientationDidChangeNotification
		object:[UIDevice currentDevice]
	];
}

-(void) mOnOrientationChanged:(NSNotification *)inNotification {
	
	UIDevice* oDevice = inNotification.object;
	switch(oDevice.orientation) {
		case UIDeviceOrientationPortrait:
			NSLog(@"Orientation changed onto Portrait");
			break;
		case UIDeviceOrientationPortraitUpsideDown:
			NSLog(@"Orientation changed onto Portrait Upside Down");
			break;
		case UIDeviceOrientationLandscapeRight:
			NSLog(@"Orientation changed onto Landscape Right");
			break;
		case UIDeviceOrientationLandscapeLeft:
			NSLog(@"Orientation changed onto Landscape Left");
			break;
		case UIDeviceOrientationFaceDown:
			NSLog(@"Orientation changed onto Face Down");
			break;
		case UIDeviceOrientationFaceUp:
			NSLog(@"Orientation changed onto Face Up");
			break;
		default:
			NSLog(@"Orientation changed onto Undefined");
			break;
	};
}

@end

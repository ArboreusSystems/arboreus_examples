//
//  HGlobal.m
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 26/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "HGlobal.h"

@implementation HGlobal


// --------------------------------------
#pragma mark - Initialisation

-(instancetype) init {
	
	self = [super init];
	if (self) {
		
		pIsPhone = [self mSetIsIphone];
		
		[[NSNotificationCenter defaultCenter]
			addObserver:self selector:@selector(mOnOrientationChanged:)
			name:UIDeviceOrientationDidChangeNotification
			object:[UIDevice currentDevice]
		];
		
	}
	return self;
}

+(HGlobal*) mInstance {
	
	static HGlobal* oInstance = nil;
	static dispatch_once_t oThread;
	dispatch_once(&oThread,^{
		oInstance = [[self alloc] init];
	});
	return oInstance;
}


// --------------------------------------
#pragma mark - Functionality

-(BOOL) mIsPhone {

	return pIsPhone;
}

-(BOOL) mSetIsIphone {

	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
		return NO;
	} else {
		return YES;
	}
}

-(BOOL) mIsLandscape {

	return pIsLandscape;
}

-(void) mSetIsLandscape {

	UIInterfaceOrientation oIOrientation = [[UIApplication sharedApplication] statusBarOrientation];
	UIDeviceOrientation oDOrientation = [[UIDevice currentDevice] orientation];
	
	if (
		oDOrientation == UIDeviceOrientationUnknown ||
		oDOrientation == UIDeviceOrientationFaceUp ||
		oDOrientation == UIDeviceOrientationFaceDown
	) {
		pIsLandscape = UIInterfaceOrientationIsLandscape(oIOrientation);
	} else {
		pIsLandscape = UIDeviceOrientationIsLandscape(oDOrientation);
	}
}

-(void) mOnOrientationChanged:(NSNotification *)inNotification {

	[self mSetIsLandscape];
}


@end

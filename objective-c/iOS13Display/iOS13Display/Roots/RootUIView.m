//
//  RootUIView.m
//  iOS13Display
//
//  Created by Alexandr Kirilov on 08/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

#import "RootUIView.h"

@interface RootUIView()

-(void) mSetupView;

@end

@implementation RootUIView

-(instancetype) initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		[self mSetupView];
	}
	return self;
}

-(id) initWithCoder:(NSCoder *)coder {
	
	self = [super initWithCoder:coder];
	if (self) {
		[self mSetupView];
	}
	return self;
}

-(void) mSetupView {
	
	if (@available(iOS 11,*)) {
		self.accessibilityIgnoresInvertColors = YES;
	}
	if (@available(iOS 13,*)) {
		self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
	}
}

@end

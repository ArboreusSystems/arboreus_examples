//
//  ALabelTemplate.m
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 06/12/2022.
//

#import "ALabelTemplate.h"

@implementation ALabelTemplate

-(instancetype) initWithFrame:(CGRect)inFrame {
	
	self = [super initWithFrame:inFrame];
	if (self) {
		
		[self setBackgroundColor:__COLOR_TRANSPARENT];
		[self setTextColor:__COLOR_WHITE];
		[self setTranslatesAutoresizingMaskIntoConstraints:NO];
		[self setFont:[UIFont boldSystemFontOfSize:18.0]];
		[self setTextAlignment:NSTextAlignmentCenter];
		
	}
	return self;
}

-(void) drawTextInRect:(CGRect)inRect {
	
	UIEdgeInsets oInsets = {0,10,0,10};
	[super drawTextInRect:UIEdgeInsetsInsetRect(inRect, oInsets)];
}

@end

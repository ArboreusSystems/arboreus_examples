//
//  AButtonTemplate.m
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 05/12/2022.
//

#import "AButtonTemplate.h"

@implementation AButtonTemplate

-(instancetype) initWithFrame:(CGRect)inFrame {
	
	self = [super initWithFrame:inFrame];
	if (self) {
		
		[self setBackgroundColor:__COLOR_PURPLE_DARK];
		[self setTranslatesAutoresizingMaskIntoConstraints:NO];
		
		[self.titleLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
		[self.titleLabel setTextColor:__COLOR_WHITE];
		
	}
	return self;
}

-(void) setHighlighted:(BOOL)inHighlighted {
	
	if(inHighlighted) {
		self.backgroundColor = __COLOR_ORANGE_DARK;
	} else {
		self.backgroundColor = __COLOR_PURPLE_DARK;
	}
	[super setHighlighted:inHighlighted];
}

@end


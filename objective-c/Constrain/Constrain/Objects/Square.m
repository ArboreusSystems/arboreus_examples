//
//  Square.m
//  Constrain
//
//  Created by Alexandr Kirilov on 2019-06-25.
//  Copyright © 2019 none. All rights reserved.
//

#import "Square.h"

@implementation Square

-(instancetype)initWithFrame:(CGRect)inFrame {

	self = [super initWithFrame:inFrame];
	if (self) {
		self.backgroundColor = [Handler mRandomColor];
	}
	return self;
}

@end

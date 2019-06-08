//
//  Object.m
//  Gestures
//
//  Created by Alexandr Kirilov on 08/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "Object.h"

@implementation Object

-(instancetype) init {

	self = [super init];
	if (self) {
		_pScale = 1.0;
		_pAngle = 0;
		[self setFrame:CGRectMake(20,20,50,50)];
		[self setBackgroundColor:[MainHandler mCreateRandomColor]];
	}
	return self;
}

@end

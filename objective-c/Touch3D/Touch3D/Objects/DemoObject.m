//
//  DemoObject.m
//  Touch3D
//
//  Created by Alexandr Kirilov on 09/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "DemoObject.h"

@implementation DemoObject

-(instancetype) init {

	self = [super init];
	if (self) {
		[self setFrame:CGRectMake(20,20,50,50)];
		[self setBackgroundColor:[MainHandler mCreateRandomColor]];
	}
	return self;
}


@end

//
//  SuperClass.m
//  OOP
//
//  Created by Alexandr Kirilov on 21/04/2020.
//  Copyright © 2020 none. All rights reserved.
//

#import "SuperClass.h"

@implementation SuperClass

-(instancetype) init {
	
	self = [super init];
	if (self) {
		_pTestString = @"Super class test string";
	}
	return self;
}

@end

//
//  ObjectBuilder.m
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-26.
//  Copyright © 2019 none. All rights reserved.
//

#import "ObjectBuilder.h"

@implementation ObjectBuilder

-(instancetype) init {

	self = [super init];
	if (self) {
		_pTestString1 = @"Initial string1 value";
		_pTestString2 = @"Initial string2 value";
		_pVersion = [NSNumber numberWithInt:1];
	}
	return self;
}

-(void) mSetString1: (NSString *) inString {

	_pTestString1 = inString;
}

-(void) mSetString2: (NSString *) inString {

	_pTestString2 = inString;
}

-(void) mSetVersion: (NSNumber *) inVersion {

	_pVersion = inVersion;
}

-(ObjectInstance *) mBuildInstance {

	ObjectInstance *oObject = [[ObjectInstance alloc] init];
	if ([_pVersion integerValue] == 1) {
		[oObject mSetString:_pTestString1];
	} else if ([_pVersion integerValue] == 2) {
		[oObject mSetString:_pTestString2];
	} else {
		[oObject mSetString:@"Default value"];
	}
	return oObject;
}

@end

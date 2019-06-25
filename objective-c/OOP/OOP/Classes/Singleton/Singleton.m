//
//  Singleton.m
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-25.
//  Copyright © 2019 none. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

-(id) init {

	self = [super init];
	if (self) {
		_pTestString = @"Initial value";
	}
	return self;
}

+(Singleton *) mGetInstance {

	static Singleton *pInstance = nil;
	static dispatch_once_t pThread;
	dispatch_once(&pThread,^{
		pInstance = [[self alloc] init];
	});
	return pInstance;
}

-(void) mSetTestString: (NSString *) inString {

	_pTestString = inString;
}

-(NSString *) mGetString {

	return _pTestString;
}

@end

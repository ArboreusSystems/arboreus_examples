//
//  InUseClass.m
//  OOP
//
//  Created by Alexandr Kirilov on 21/04/2020.
//  Copyright © 2020 none. All rights reserved.
//

#import "InUseClass.h"

@implementation InUseClass

@synthesize pTestString;

-(instancetype) init {
	self = [super init];
	if (self) {
		pTestString = super.pTestString;
	}
	return self;
}

-(void) mTestString {
	
	NSLog(@"Test string from super class: %@",super.pTestString);
	NSLog(@"Test string from current class: %@",pTestString);
	
	pTestString = @"In-use class redefined string";
	NSLog(@"Test string from current class: %@",pTestString);
	NSLog(@"Test string from super class: %@",super.pTestString);
}

@end

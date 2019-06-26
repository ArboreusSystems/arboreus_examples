//
//  ObjectInstance.m
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-26.
//  Copyright © 2019 none. All rights reserved.
//

#import "ObjectInstance.h"

@implementation ObjectInstance

-(void) mSetString: (NSString *) inString {

	_pTestString = inString;
}

-(NSString *) mGetString {

	return _pTestString;
}

@end

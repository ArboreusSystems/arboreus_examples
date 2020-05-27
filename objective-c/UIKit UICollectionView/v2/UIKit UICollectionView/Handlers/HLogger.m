//
//  HLogger.m
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 26/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "HLogger.h"

@implementation HLogger


// --------------------------------------
#pragma mark - Initialisation

@synthesize pTestString;

-(id) init {
	
	self = [super init];
	if (self) {
		
	}
	return self;
}

+(HLogger*) mInstance {
	
	static HLogger* oInstance = nil;
	static dispatch_once_t oThread;
	dispatch_once(&oThread,^{
		oInstance = [[self alloc] init];
	});
	return oInstance;
}


// --------------------------------------
#pragma mark - Functionality

-(void) mMessage:(HLoggerMessageType)inType inMessage:(NSString*)inMessage inFunction:(const char*)inFunction inLine:(int)inLine {
	
	NSLog(
		@"%@ %@ %s-[Line %d]",
		HLoggerMessageTypeToString[inType],
		inMessage,
		inFunction,
		inLine
	);
}

@end

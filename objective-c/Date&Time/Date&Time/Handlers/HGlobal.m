//
//  HGlobal.m
//  Date&Time
//
//  Created by Alexandr Kirilov on 20/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "HGlobal.h"

@implementation HGlobal


// --------------------------------------
#pragma mark - Init

-(instancetype) init {

	self = [super init];
	if (self) {
		
		pLogger = [HLogger mInstance];
		
	};
	return self;
}

+(HGlobal*) mInstance {
	
	static HGlobal* oInstance = nil;
	static dispatch_once_t oThread;
	dispatch_once(&oThread,^{
		oInstance = [[self alloc] init];
	});
	return oInstance;
}


// --------------------------------------
#pragma mark - Functionality

@end

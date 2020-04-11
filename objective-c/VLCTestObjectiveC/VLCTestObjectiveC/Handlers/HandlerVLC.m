//
//  HandlerVLC.m
//  VLCTestObjectiveC
//
//  Created by Alexandr Kirilov on 08/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "HandlerVLC.h"

@implementation HandlerVLC

-(id) init {
	
	self = [super init];
	if (self) {
		_pPlayer = [[VLCMediaPlayer alloc] init];
	}
	return self;
}

+(HandlerVLC*) mInstance {
	
	static HandlerVLC* oInstance = nil;
	static dispatch_once_t oThread;
	dispatch_once(&oThread,^{
		oInstance = [[self alloc] init];
	});
	return oInstance;
}

@end

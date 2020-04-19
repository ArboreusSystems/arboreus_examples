//
//  HandlerLogger.m
//  NSLog
//
//  Created by Alexandr Kirilov on 19/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "HandlerLogger.h"

@implementation HandlerLogger

-(void) mMessage {
	
	NSLog(@"_cmd: %s" , _cmd);
	NSLog(@"NSStringFromSelector(_cmd): %@", NSStringFromSelector(_cmd));
	NSLog(@"__PRETTY_FUNCTION__: %s", __PRETTY_FUNCTION__);
	NSLog((@"%s [Line %d] "), __PRETTY_FUNCTION__, __LINE__);
}

-(void) mMessage:(NSString *)inMessage inFunction:(const char*)inFunction inLine:(int)inLine {
	
	NSLog((@"%@ -> %s [Line %d] "),inMessage,inFunction,inLine);
}

@end

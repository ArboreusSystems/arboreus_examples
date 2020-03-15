//
//  LogHandler.m
//  LocalNotifications
//
//  Created by Alexandr Kirilov on 15/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "LogHandler.h"

@implementation LogHandler

+(void) mPrint:(NSString*)inClass inMethod:(NSString*)inMethod inMessage:(NSString*)inMessage {
	
	NSLog(@"[%@ %@] %@",inClass,inMethod,inMessage);
}

@end

//
//  LogHandler.h
//  LocalNotifications
//
//  Created by Alexandr Kirilov on 15/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define A_LOG(Message) [LogHandler mPrint:NSStringFromClass([self class]) inMethod:NSStringFromSelector(_cmd) inMessage:Message];
#define A_BOOL_STRING(Bool) Bool ? @"true" : @"false"

@interface LogHandler : NSObject

+(void) mPrint:(NSString*)inClass inMethod:(NSString*)inMethod inMessage:(NSString*)inMessage;

@end

NS_ASSUME_NONNULL_END

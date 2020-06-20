//
//  HLogger.h
//  Date&Time
//
//  Created by Alexandr Kirilov on 20/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HLoggerMessageType.h" 

NS_ASSUME_NONNULL_BEGIN

#define H_LOGGER_MESSAGE(Type,Message) [pLogger mMessage:Type inMessage:Message inFunction:__PRETTY_FUNCTION__ inLine:__LINE__]
#define H_LOGGER_MESSAGE_NOTICE(Message) H_LOGGER_MESSAGE(HLoggerMessageNotice,Message)
#define H_LOGGER_MESSAGE_WARNING(Message) H_LOGGER_MESSAGE(HLoggerMessageWarning,Message)
#define H_LOGGER_MESSAGE_CRITICAL(Message) H_LOGGER_MESSAGE(HLoggerMessageCritical,Message)
#define H_LOGGER_MESSAGE_USER_ACTION(Message) H_LOGGER_MESSAGE(HLoggerMessageUserAction,Message)

#define H_LOGGER_MESSAGE_SELF(Type,Message) [self->pLogger mMessage:Type inMessage:Message inFunction:__PRETTY_FUNCTION__ inLine:__LINE__]
#define H_LOGGER_MESSAGE_SELF_NOTICE(Message) H_LOGGER_MESSAGE_SELF(HLoggerMessageNotice,Message)
#define H_LOGGER_MESSAGE_SELF_WARNING(Message) H_LOGGER_MESSAGE_SELF(HLoggerMessageWarning,Message)
#define H_LOGGER_MESSAGE_SELF_CRITICAL(Message) H_LOGGER_MESSAGE_SELF(HLoggerMessageCritical,Message)
#define H_LOGGER_MESSAGE_SELF_USER_ACTION(Message) H_LOGGER_MESSAGE_SELF(HLoggerMessageUserAction,Message)

#define H_LOG_GLOBAL(Type,Message) [oHandlerLogger mMessage:Type inMessage:Message inFunction:__PRETTY_FUNCTION__ inLine:__LINE__]
#define H_LOG_GLOBAL_NOTICE(Message) H_LOG_GLOBAL(HLoggerMessageNotice,Message)
#define H_LOG_GLOBAL_WARNING(Message) H_LOG_GLOBAL(HLoggerMessageWarning,Message)
#define H_LOG_GLOBAL_CRITICAL(Message) H_LOG_GLOBAL(HLoggerMessageCritical,Message)
#define H_LOG_GLOBAL_USER_ACTION(Message) H_LOG_GLOBAL(HLoggerMessageUserAction,Message)

@interface HLogger : NSObject

@property (nonatomic,strong) NSString* pTestString;

+(HLogger*) mInstance;
-(void) mMessage:(HLoggerMessageType)inType inMessage:(NSString*)inMessage inFunction:(const char*)inFunction inLine:(int)inLine;

@end

NS_ASSUME_NONNULL_END


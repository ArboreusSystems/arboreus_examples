//
//  HandlerLogger.h
//  NSLog
//
//  Created by Alexandr Kirilov on 19/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HandlerLogger : NSObject

-(void) mMessage;
-(void) mMessage:(NSString*)inMessage inFunction:(const char*)inFunction inLine:(int)inLine;

@end

NS_ASSUME_NONNULL_END

//
//  Handler.h
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Based on raywanderlich.com video and official Apple developers documentation
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Handler : NSObject
    +(void) exit;
    +(void) messageToLog: (NSString *) inMessage;
@end

NS_ASSUME_NONNULL_END

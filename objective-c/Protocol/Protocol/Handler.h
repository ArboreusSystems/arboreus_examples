//
//  Handler.h
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Handler : NSObject
    +(void) exit;
    +(void) messageToLog: (NSString *) inMessage;
@end

NS_ASSUME_NONNULL_END

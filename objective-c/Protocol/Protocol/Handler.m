//
//  Handler.m
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "Handler.h"

@implementation Handler

+(void) exit {
    [self messageToLog:@"Application is about to exit"];
    exit(0);
}

+(void) messageToLog: (NSString *) inMessage {
   NSLog(@"%@",inMessage);
}

@end

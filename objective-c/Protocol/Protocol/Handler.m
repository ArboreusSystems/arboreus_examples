//
//  Handler.m
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Based on raywanderlich.com video and official Apple developers documentation
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

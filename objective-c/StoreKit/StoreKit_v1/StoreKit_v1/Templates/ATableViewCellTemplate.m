//
//  ATableViewCellTemplate.m
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 30/11/2022.
//

#import "ATableViewCellTemplate.h"

@implementation ATableViewCellTemplate

+(NSString*) mIdentifier {
    
    return @"ATableViewCellTemplateIdentifier";
}

-(instancetype) initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self sendSubviewToBack:[self contentView]];
        
    }
    return self;
}

@end

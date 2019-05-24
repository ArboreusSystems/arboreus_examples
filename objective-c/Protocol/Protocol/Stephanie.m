//
//  Stephanie.m
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Based on raywanderlich.com video and official Apple developers documentation
//

#import "Stephanie.h"

@implementation Stephanie

-(instancetype) init {
    self = [super init];
    if (self) {
        self.name = @"Stephanie";
    }
    return self;
}

-(void) frecklesDidSmackLips: (Freckles *) inFreckles {
    NSLog(@"%@: Ok Freckles, let's go outside",self.name);
}

-(void) frecklesDidLookHopeful: (Freckles *) inFreckles {
    NSLog(@"%@: Here ya go Freckles, here's biscuit",self.name);
}

@end

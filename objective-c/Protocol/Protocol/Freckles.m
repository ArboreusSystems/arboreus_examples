//
//  Freckles.m
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Based on raywanderlich.com video and official Apple developers documentation
//

#import "Freckles.h"

@implementation Freckles

-(void) hasToGoBathroom {
    [_delegate frecklesDidSmackLips:self];
}

-(void) isHungry {
    [_delegate frecklesDidLookHopeful:self];
}

@end

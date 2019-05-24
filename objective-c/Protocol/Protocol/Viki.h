//
//  Viki.h
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Freckles.h"

NS_ASSUME_NONNULL_BEGIN

@class Freckles;

@interface Viki : NSObject <FrecklesDelegate>

@property (nonatomic,strong) NSString *name;

-(void) frecklesDidSmackLips: (Freckles *) oFreckles;
-(void) frecklesDidLookHopeful: (Freckles *) oFreckles;

@end

NS_ASSUME_NONNULL_END

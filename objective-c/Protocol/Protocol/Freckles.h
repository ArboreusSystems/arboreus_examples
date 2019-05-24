//
//  Freckles.h
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Freckles;

@protocol FrecklesDelegate <NSObject>
@required
    -(void) frecklesDidSmackLips: (Freckles *) oFreckles;
    -(void) frecklesDidLookHopeful: (Freckles *) oFreckles;
@end

@interface Freckles : NSObject
    @property (nonatomic,weak) id<FrecklesDelegate> delegate;
    -(void) hasToGoBathroom;
    -(void) isHungry;
@end

NS_ASSUME_NONNULL_END

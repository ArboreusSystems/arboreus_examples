//
//  Freckles.h
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Based on raywanderlich.com video and official Apple developers documentation
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

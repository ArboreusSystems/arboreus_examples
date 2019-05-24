//
//  Stephanie.h
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Based on raywanderlich.com video and official Apple developers documentation
//

#import <Foundation/Foundation.h>
#import "Freckles.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stephanie : NSObject <FrecklesDelegate>
    @property (nonatomic,strong) NSString *name;
    -(void) frecklesDidSmackLips: (Freckles *) oFreckles;
    -(void) frecklesDidLookHopeful: (Freckles *) oFreckles;
@end

NS_ASSUME_NONNULL_END

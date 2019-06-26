//
//  SubscriptionBuilder.h
//  Subscription
//
//  Created by Alexandr Kirilov on 2019-06-26.
//  Copyright © 2019 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "Subscription.h"

NS_ASSUME_NONNULL_BEGIN

#define SUBS_PRODUCT_ID @"arboreus.objectivec.subscription"

@interface SubscriptionBuilder : NSObject <SKProductsRequestDelegate>



@end

NS_ASSUME_NONNULL_END

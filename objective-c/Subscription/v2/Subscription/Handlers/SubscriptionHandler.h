//
//  SubscriptionHandler.h
//  Subscription
//
//  Created by Alexandr Kirilov on 27/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "ReceiptHandler.h"

NS_ASSUME_NONNULL_BEGIN

#define SUBS_PRODUCT_ID @"arboreus.objectivec.subscription"

@class SubscriptionViewController;

@protocol SubscriptionViewProtocol

-(void) mViewInProgress;
-(void) mViewSubscribed: (NSString *) inText;
-(void) mViewSubscribe: (NSString *) inTitle;
-(void) mViewCanNotSubscribe: (NSString *) inTitle;

@end

@interface SubscriptionHandler : NSObject <SKProductsRequestDelegate,SKPaymentTransactionObserver>

@property (nonatomic,weak) SubscriptionViewController *pViewController;
@property (nonatomic,strong) SKProduct *pSubscriptionProduct;
@property (nonatomic,strong) SKPaymentQueue *pDefaultPaymentQueue;

-(instancetype) initWithView: (SubscriptionViewController *) inView;
-(void) mSubscribe;
-(void) mRestore;

@end

NS_ASSUME_NONNULL_END

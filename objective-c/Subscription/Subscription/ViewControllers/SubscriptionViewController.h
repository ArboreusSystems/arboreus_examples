//
//  SubscriptionViewController.h
//  Subscription
//
//  Created by Alexandr Kirilov on 2019-06-26.
//  Copyright © 2019 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Handlers/Handler.h"
#import "../Subscription/Subscription.h"
#import "../Subscription/SubscriptionBuilder.h"

NS_ASSUME_NONNULL_BEGIN

@interface SubscriptionViewController : UIViewController <SKProductsRequestDelegate,SKPaymentTransactionObserver>

@property CGFloat pScreenWidth;
@property CGFloat pScreenHeight;
@property CGFloat pElementsWidth;
@property CGFloat pElementsHeight;

@property (nonatomic,strong) UIView *pSubscriptionView;
@property (nonatomic,strong) Subscription *pSubscription;
@property (nonatomic,strong) SKProduct *pSubscriptionProduct;
@property (nonatomic,strong) SKPaymentQueue *pDefaultQueue;

-(void) mViewCanNotPay;
-(void) mViewSubscribe: (NSString *) inTitle;
-(void) mViewSubscribed: (NSString *) inText;
-(void) mViewInProgress;

@end

NS_ASSUME_NONNULL_END

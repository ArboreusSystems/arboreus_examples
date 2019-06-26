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

@protocol SubscriptionViewProtocol

@required
-(void) mViewCanNotPay;
-(void) mViewSubscribe: (NSString *) inTitle;
-(void) mViewSubscribed: (NSString *) inText;
-(void) mViewInProgress;

@end

@interface SubscriptionViewController : UIViewController <SubscriptionViewProtocol>

@property CGFloat pScreenWidth;
@property CGFloat pScreenHeight;
@property CGFloat pElementsWidth;
@property CGFloat pElementsHeight;

@property (nonatomic,strong) UIView *pSubscriptionView;
@property (nonatomic,strong) Subscription *pSubscription;

@end

NS_ASSUME_NONNULL_END

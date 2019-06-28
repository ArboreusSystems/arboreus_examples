//
//  SubscriptionViewController.h
//  Subscription
//
//  Created by Alexandr Kirilov on 27/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Handlers/MainHandler.h"
#import "../Handlers/SubscriptionHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface SubscriptionViewController : UIViewController <SubscriptionViewProtocol>

@property (nonatomic,strong) SubscriptionHandler *pSubscription;
@property (nonatomic,strong) UIView *pSubscriptionView;

@property CGFloat pScreenWidth;
@property CGFloat pScreenHeight;
@property CGFloat pElementsWidth;
@property CGFloat pElementsHeight;

-(void) mViewInProgress;
-(void) mViewSubscribed: (NSString *) inText;
-(void) mViewSubscribe: (NSString *) inTitle;
-(void) mViewCanNotSubscribe: (NSString *) inTitle;

@end

NS_ASSUME_NONNULL_END

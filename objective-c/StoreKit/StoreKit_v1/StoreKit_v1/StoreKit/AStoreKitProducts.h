//
//  AStoreKitProducts.h
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 05/12/2022.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#import "../Logger/ALogger.h"


NS_ASSUME_NONNULL_BEGIN

@interface AStoreKitProducts : NSObject

@property (strong,atomic) NSMutableArray<SKProduct*>* pConsumable;
@property (strong,atomic) NSMutableArray<SKProduct*>* pNonConsumable;
@property (strong,atomic) NSMutableArray<SKProduct*>* pRenewableSubscriptions;
@property (strong,atomic) NSMutableArray<SKProduct*>* pNonRenewableSubscriptions;

@end

NS_ASSUME_NONNULL_END

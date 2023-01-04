//
//  AStoreKitProducts.h
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 04/01/2023.
//

#import <Foundation/Foundation.h>

#import "StoreKit_v2-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface AStoreKitProducts : NSObject

@property (strong,atomic) NSMutableArray<AStoreKitHandlerProduct*>* pConsumable;
@property (strong,atomic) NSMutableArray<AStoreKitHandlerProduct*>* pNonConsumable;
@property (strong,atomic) NSMutableArray<AStoreKitHandlerProduct*>* pRenewableSubscriptions;
@property (strong,atomic) NSMutableArray<AStoreKitHandlerProduct*>* pNonRenewableSubscriptions;

@end

NS_ASSUME_NONNULL_END

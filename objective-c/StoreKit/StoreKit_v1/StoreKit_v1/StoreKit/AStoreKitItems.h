//
//  AStoreKitItems.h
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 05/12/2022.
//

#import <Foundation/Foundation.h>

#import "../Logger/ALogger.h"


NS_ASSUME_NONNULL_BEGIN

@interface AStoreKitItems : NSObject

@property (strong,atomic) NSMutableSet<NSString*>* pConsumable;
@property (strong,atomic) NSMutableSet<NSString*>* pNonConsumable;
@property (strong,atomic) NSMutableSet<NSString*>* pRenewableSubscriptions;
@property (strong,atomic) NSMutableSet<NSString*>* pNonRenewableSubscriptions;

@end

NS_ASSUME_NONNULL_END

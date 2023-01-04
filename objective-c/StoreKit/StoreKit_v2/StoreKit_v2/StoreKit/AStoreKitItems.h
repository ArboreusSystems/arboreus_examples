//
//  AStoreKitItems.h
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 04/01/2023.
//

#import <Foundation/Foundation.h>

#import "../Logger/ALogger.h"


NS_ASSUME_NONNULL_BEGIN

@interface AStoreKitItems : NSObject

@property (strong,atomic) NSMutableArray<NSString*>* pConsumable;
@property (strong,atomic) NSMutableArray<NSString*>* pNonConsumable;
@property (strong,atomic) NSMutableArray<NSString*>* pRenewableSubscriptions;
@property (strong,atomic) NSMutableArray<NSString*>* pNonRenewableSubscriptions;

@end

NS_ASSUME_NONNULL_END

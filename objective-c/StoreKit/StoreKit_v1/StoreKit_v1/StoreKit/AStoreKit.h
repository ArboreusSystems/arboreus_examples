//
//  AStoreKit.h
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 05/12/2022.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#import "AStoreKitItems.h"
#import "AStoreKitProducts.h"
#import "AStoreKitDelegate.h"
#import "../Logger/ALogger.h"


NS_ASSUME_NONNULL_BEGIN

@interface AStoreKit : NSObject <SKRequestDelegate,SKProductsRequestDelegate,SKPaymentTransactionObserver>

@property (nonatomic, weak) id<AStoreKitDelegate> pDelegate;
@property (strong,atomic) SKProductsRequest* pRequest;
@property (strong,atomic) AStoreKitItems* pItems;
@property (strong,atomic) AStoreKitProducts* pProducts;

+(instancetype) mSharedInstance;
-(void) mRequestProducts:(NSMutableSet<NSString*>*)inIDs;
-(void) mBuyProduct:(SKProduct*)inProduct;
-(void) mRestoreProducts;

@end

NS_ASSUME_NONNULL_END

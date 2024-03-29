//
//  AStoreKit.h
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#import "StoreKit_v2-Swift.h"
#import "../Logger/ALogger.h"
#import "AStoreKitItems.h"
#import "AStoreKitProducts.h"
#import "AStoreKitDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AStoreKit : NSObject <AStorekitHandlerDelegate>

@property (weak,nonatomic) id<AStoreKitDelegate> pDelegate;
@property (strong,atomic) AStoreKitHandler* pHandler;
@property (strong,atomic) AStoreKitItems* pItems;
@property (strong,atomic) AStoreKitProducts* pProducts;

+(instancetype) mSharedInstance;
-(void) mRequestProducts;
-(void) mBuyProduct:(NSString*)inProduct;

@end

NS_ASSUME_NONNULL_END

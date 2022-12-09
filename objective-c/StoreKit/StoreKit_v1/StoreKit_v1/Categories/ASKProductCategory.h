//
//  ASKProduct.h
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 07/12/2022.
//

#import <StoreKit/StoreKit.h>
#import <objc/runtime.h>


NS_ASSUME_NONNULL_BEGIN

static char const* const gASKProductIsPurchasedKey = "ASKProductIsPurchasedKey";
static char const* const gASKProductCounterKey = "ASKProductCounterKey";

@interface SKProduct(ACategories)

@property (readwrite) BOOL pIsPuchased;
@property (readwrite) NSNumber* pCounter;

@end

NS_ASSUME_NONNULL_END

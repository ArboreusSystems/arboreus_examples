//
//  AStoreKitDelegate.h
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 05/12/2022.
//

#ifndef AStoreKitDelegate_h
#define AStoreKitDelegate_h

#import <StoreKit/StoreKit.h>

#import "../Categories/ASKProductCategory.h"

@protocol AStoreKitDelegate <NSObject>

-(void) mOnUpdateProducts;

@end

#endif /* AStoreKitDelegate_h */

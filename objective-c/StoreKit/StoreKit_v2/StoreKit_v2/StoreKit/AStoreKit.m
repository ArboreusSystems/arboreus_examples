//
//  AStoreKit.m
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import "AStoreKit.h"

@implementation AStoreKit


// ---------------------------------
#pragma mark - Init

+(instancetype) mSharedInstance {
	
	static AStoreKit* oSharedInstance = nil;
	static dispatch_once_t oToken;
	dispatch_once(&oToken,^{
		oSharedInstance = [[AStoreKit alloc] init];
		NSLog(@"IN_APP_PURCHASE AStoreKit created");
	});
	
	NSLog(@"IN_APP_PURCHASE AStoreKit instance return");
	return oSharedInstance;
}

-(instancetype) init {
	
	self = [super init];
	if (self) {
		
		[self setPHandler:[[AStoreKitHandler alloc] init]];
		[_pHandler setPDelegate:self];
		
		[self setPItems:[[AStoreKitItems alloc] init]];
		[self setPProducts:[[AStoreKitProducts alloc] init]];
		
	}
	return self;
}


// ---------------------------------
#pragma mark - StoreKit

-(void) mRequestProducts {
	
	NSLog(@"IN_APP_PURCHASE Requesting products");
	
	NSMutableArray<NSString*>* oIDs = _pItems.pConsumable;
	[oIDs addObjectsFromArray:_pItems.pNonConsumable];
	[oIDs addObjectsFromArray:_pItems.pRenewableSubscriptions];
	[oIDs addObjectsFromArray:_pItems.pNonRenewableSubscriptions];
	
	[_pHandler mRequestProductsInIDs:oIDs completionHandler:^(NSArray<AStoreKitHandlerProduct*>* _Nullable inProducts, NSError* _Nullable inError) {
		
		if (!inError) {
		
			for (int i = 0; i < [inProducts count]; i++) {
				switch (inProducts[i].pType) {
					case AStoreKitHandlerProductTypeConsumable:
						[self->_pProducts.pConsumable addObject:inProducts[i]];
						break;
					case AStoreKitHandlerProductTypeNonConsumable:
						[self->_pProducts.pNonConsumable addObject:inProducts[i]];
						break;
					case AStoreKitHandlerProductTypeRenewableSubscription:
						[self->_pProducts.pRenewableSubscriptions addObject:inProducts[i]];
						break;
					case AStoreKitHandlerProductTypeNonRenewableSubscription:
						[self->_pProducts.pNonRenewableSubscriptions addObject:inProducts[i]];
						break;
					default:
						NSLog(@"ERROR! Wrong type of the product: %@",inProducts[i].pID);
						break;
				}
			}
			NSLog([NSString stringWithFormat:@"IN_APP_PURCHASE Concumable: %lu",(unsigned long)[self->_pProducts.pConsumable count]]);
			NSLog([NSString stringWithFormat:@"IN_APP_PURCHASE NonConcumable: %lu",(unsigned long)[self->_pProducts.pNonConsumable count]]);
			NSLog([NSString stringWithFormat:@"IN_APP_PURCHASE RenewableSubscription: %lu",(unsigned long)[self->_pProducts.pRenewableSubscriptions count]]);
			NSLog([NSString stringWithFormat:@"IN_APP_PURCHASE NonRenewableSubscription: %lu",(unsigned long)[self->_pProducts.pNonRenewableSubscriptions count]]);
			
			[self->_pDelegate mOnUpdateProducts];
			
		} else {
			NSLog(@"ERROR! Requesting products failed with: %@",[inError localizedDescription]);
		}
	}];
}

-(void) mBuyProduct:(NSString *)inProduct {
	
	[_pHandler mBuyProductInID:inProduct completionHandler:^(NSError* _Nullable inError) {
		
		if (inError) {
			NSLog(@"ERROR! Buying product failed with: %@",inError.localizedDescription);
		}
	}];
}


// ---------------------------------
#pragma mark - AStorekitHandlerDelegate

-(void) mBuyProductSuccessVerifiedInProduct:(AStoreKitHandlerProduct*)inProduct {
	
	NSLog(@"Buying product success and verified: %@",inProduct.pID)
}

-(void) mBuyProductSuccessNotVerifiedInProduct:(AStoreKitHandlerProduct*)inProduct inError:(NSError*)inError {
	
	NSLog(@"Buying product success and NOT verified: %@ with error: %@",inProduct.pID,inError.localizedDescription);
}

-(void) mBuyProductPendingInProduct:(AStoreKitHandlerProduct*)inProduct {
	
	NSLog(@"Buying product pending: %@",inProduct.pID);
}

-(void) mBuyProductUserCanceledInProduct:(AStoreKitHandlerProduct*)inProduct {
	
	NSLog(@"Buying product canceled by user: %@",inProduct.pID);
}

-(void) mBuyProductUndefinedResultInProduct:(AStoreKitHandlerProduct*)inProduct {
	
	NSLog(@"Undefined result of buying product: %@",inProduct.pID);
}

-(void) mTransactionUpdatesInTransaction:(AStoreKitHandlerTransaction*)inTransaction {
	
	NSLog(@"mTransactionUpdates");
}

-(void) mPaymentQueueUpdatedTransactions {
	
	NSLog(@"mPaymentQueueUpdatedTransactions");
}

-(BOOL) mPaymentQueueShouldAddStorePayment {
	
	NSLog(@"mPaymentQueueShouldAddStorePayment");
	
	return true;
}

@end

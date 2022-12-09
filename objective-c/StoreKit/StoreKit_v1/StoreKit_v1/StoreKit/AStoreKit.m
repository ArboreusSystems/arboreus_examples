//
//  AStoreKit.m
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 05/12/2022.
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
		
		[self setPItems:[[AStoreKitItems alloc] init]];
		[self setPProducts:[[AStoreKitProducts alloc] init]];
		
	}
	return  self;
}


// ---------------------------------------
#pragma mark StoreKit

-(void) mRequestProducts:(NSMutableSet<NSString*>*)inIDs {
	
	NSLog(@"IN_APP_PURCHASE Requesting products");
	
	if (_pRequest) [_pRequest cancel];
	[self setPRequest:[[SKProductsRequest alloc] initWithProductIdentifiers:inIDs]];
	[_pRequest setDelegate:self];
	[_pRequest start];
}

-(void) mBuyProduct:(SKProduct*)inProduct {
	
	NSLog(@"IN_APP_PURCHASE Buy product: %@",inProduct.productIdentifier);
	
	SKPayment* oPayment = [SKPayment paymentWithProduct:inProduct];
	[[SKPaymentQueue defaultQueue] addPayment:oPayment];
}

-(void) mRestoreProducts {
	
	[[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}


// ---------------------------------------
#pragma mark SKRequestDelegate

-(void) requestDidFinish:(SKRequest*)inRequest {
	
	NSLog(@"IN_APP_PURCHASE requestDidFinish");
}

-(void) request:(SKRequest*)inRequest didFailWithError:(NSError*)inError {
	
	NSLog(@"IN_APP_PURCHASE request didFailWithError: %@",inError.localizedDescription);
}


// ---------------------------------------
#pragma mark SKProductsRequestDelegate

-(void) productsRequest:(SKProductsRequest*)inRequest didReceiveResponse:(SKProductsResponse*)inResponse {
	
	NSLog(@"IN_APP_PURCHASE didReceiveResponse");
	
	dispatch_async(dispatch_get_main_queue(), ^{
		
		[self->_pProducts.pConsumable removeAllObjects];
		[self->_pProducts.pNonConsumable removeAllObjects];
		[self->_pProducts.pRenewableSubscriptions removeAllObjects];
		[self->_pProducts.pNonRenewableSubscriptions removeAllObjects];
		
		for (SKProduct* iProduct in inResponse.products) {
			if ([self->_pItems.pConsumable containsObject:iProduct.productIdentifier]) {
				[self->_pProducts.pConsumable addObject:iProduct];
			} else if ([self->_pItems.pNonConsumable containsObject:iProduct.productIdentifier]) {
				[self->_pProducts.pNonConsumable addObject:iProduct];
			} else if ([self->_pItems.pRenewableSubscriptions containsObject:iProduct.productIdentifier]) {
				[self->_pProducts.pRenewableSubscriptions addObject:iProduct];
			} else if ([self->_pItems.pNonRenewableSubscriptions containsObject:iProduct.productIdentifier]) {
				[self->_pProducts.pNonRenewableSubscriptions addObject:iProduct];
			} else {
				NSLog([NSString stringWithFormat:@"ERROR! Wrong product ID: %@",iProduct.productIdentifier]);
			}
		}
		
		NSLog([NSString stringWithFormat:@"IN_APP_PURCHASE Concumable: %lu",(unsigned long)[self->_pProducts.pConsumable count]]);
		NSLog([NSString stringWithFormat:@"IN_APP_PURCHASE NonConcumable: %lu",(unsigned long)[self->_pProducts.pNonConsumable count]]);
		NSLog([NSString stringWithFormat:@"IN_APP_PURCHASE RenewableSubscription: %lu",(unsigned long)[self->_pProducts.pRenewableSubscriptions count]]);
		NSLog([NSString stringWithFormat:@"IN_APP_PURCHASE NonRenewableSubscription: %lu",(unsigned long)[self->_pProducts.pNonRenewableSubscriptions count]]);
		
		[self->_pDelegate mOnUpdateProducts];
	});
}


// ---------------------------------------
#pragma mark SKPaymentTransactionObserver

-(void) paymentQueue:(SKPaymentQueue*)inQueue updatedTransactions:(NSArray<SKPaymentTransaction*> *)inTransactions {
	
	NSLog(@"IN_APP_PURCHASE updatedTransactions");
	
	for (SKPaymentTransaction* iTransaction in inTransactions) {
		switch (iTransaction.transactionState) {
			case SKPaymentTransactionStateFailed:
				NSLog(@"IN_APP_PURCHASE SKPaymentTransactionStateFailedTID: %@ PID: %@",
					iTransaction.transactionIdentifier,
					iTransaction.payment.productIdentifier
				);
				[self mTransactionFailed:iTransaction];
				break;
			case SKPaymentTransactionStateRestored:
				NSLog(@"IN_APP_PURCHASE SKPaymentTransactionStateRestoredTID: %@ PID: %@",
					iTransaction.transactionIdentifier,
					iTransaction.payment.productIdentifier
				);
				[self mTransactionRestored:iTransaction];
				break;
			case SKPaymentTransactionStatePurchased:
				NSLog(@"IN_APP_PURCHASE SKPaymentTransactionStatePurchased TID: %@ PID: %@",
					iTransaction.transactionIdentifier,
					iTransaction.payment.productIdentifier
				);
				[self mTransactionPurchased:iTransaction];
				break;
			case SKPaymentTransactionStateDeferred:
				NSLog(@"IN_APP_PURCHASE SKPaymentTransactionStateDeferredTID: %@ PID: %@",
					iTransaction.transactionIdentifier,
					iTransaction.payment.productIdentifier
				);
				break;
			case SKPaymentTransactionStatePurchasing:
				NSLog(@"IN_APP_PURCHASE SKPaymentTransactionStatePurchasingTID: %@ PID: %@",
					iTransaction.transactionIdentifier,
					iTransaction.payment.productIdentifier
				);
				break;
			default:
				NSLog(@"IN_APP_PURCHASE Unhandled transaction state for: %@ state: %@",inTransactions.description,iTransaction.transactionState);
				break;
		}
	}
}

-(void) paymentQueue:(SKPaymentQueue*)queue removedTransactions:(NSArray<SKPaymentTransaction*>*)inTransactions {

	NSLog(@"IN_APP_PURCHASE removedTransactions");
	
//	for (SKPaymentTransaction* iTransaction in inTransactions) {
//		NSLog(@"IN_APP_PURCHASE Unhandled transaction state for: %@ state: %@",inTransactions.description,iTransaction.transactionState);
//	}
}

-(void) paymentQueue:(SKPaymentQueue*)inQueue restoreCompletedTransactionsFailedWithError:(NSError*)inError {
	
	NSLog(@"IN_APP_PURCHASE restoreCompletedTransactionsFailedWithError");
}

-(void) paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue*)inQueue {
	
	NSLog(@"IN_APP_PURCHASE paymentQueueRestoreCompletedTransactionsFinished");
}

-(void) paymentQueue:(SKPaymentQueue*)inQueue updatedDownloads:(NSArray<SKDownload*>*)inDownloads {
	
	NSLog(@"IN_APP_PURCHASE updatedDownloads");
}

-(BOOL) paymentQueue:(SKPaymentQueue*)inQueue shouldAddStorePayment:(SKPayment*)inPayment forProduct:(SKProduct*)inProduct {
	
	NSLog(@"IN_APP_PURCHASE paymentQueue shouldAddStorePayment forProduct");
	
	return YES;
}

-(void) paymentQueueDidChangeStorefront:(SKPaymentQueue*)queue {
	
	NSLog(@"IN_APP_PURCHASE paymentQueueDidChangeStorefront");
}

-(void) paymentQueue:(SKPaymentQueue*)inQueue didRevokeEntitlementsForProductIdentifiers:(NSArray<NSString*>*)inProductIdentifiers {

	NSLog(@"IN_APP_PURCHASE paymentQueue didRevokeEntitlementsForProductIdentifiers");
	
//	for (NSString* iID in inProductIdentifiers) {
//		NSLog(@"IN_APP_PURCHASE Revoke entitlement for: %@",iID);
//	}
}


// ---------------------------------------
#pragma mark Private

-(void) mTransactionPurchased:(SKPaymentTransaction*)inTransaction {

	// receipt validation logic goes here
	
	[self mDeliverPurchaseNotification:[inTransaction.payment productIdentifier]];
	[[SKPaymentQueue defaultQueue] finishTransaction:inTransaction];
}

-(void) mTransactionFailed:(SKPaymentTransaction*)inTransaction {

	if ([inTransaction error]) {
		NSError* oError = [inTransaction error];
		if ([oError code] != SKErrorPaymentCancelled) {
			NSLog(@"IN_APP_PURCHASE Payment error with code: %d %@",[oError code],[oError description]);
		} else {
			NSLog(@"IN_APP_PURCHASE Payment canceled");
		}
	}
	
	[[SKPaymentQueue defaultQueue] finishTransaction:inTransaction];
}

-(void) mTransactionRestored:(SKPaymentTransaction*)inTransaction {
	
	[self mTransactionPurchased:inTransaction];
}

-(void) mDeliverPurchaseNotification:(NSString*)inProductID {
	
}

@end

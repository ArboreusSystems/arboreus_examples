//
//  SubscriptionHandler.m
//  Subscription
//
//  Created by Alexandr Kirilov on 27/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "SubscriptionHandler.h"
#import "SubscriptionViewController.h"


@implementation SubscriptionHandler


#pragma mark Object init

-(instancetype) initWithView: (SubscriptionViewController *) inView {

	self = [super init];
	if (self) {
		_pViewController = inView;
		[_pViewController mViewInProgress];
		if(![SKPaymentQueue canMakePayments]) {
			[_pViewController mViewCanNotSubscribe:@"You can not pay"];
			return self;
		}

		_pDefaultPaymentQueue = [SKPaymentQueue defaultQueue];
		[_pDefaultPaymentQueue addTransactionObserver:self];

		SKProductsRequest *oRequest = [[SKProductsRequest alloc]
			initWithProductIdentifiers:[NSSet setWithObject:SUBS_PRODUCT_ID]
		];
		oRequest.delegate = self;
		[oRequest start];
		NSLog(@"SubscriptionHandler initiated");
	}
	return self;
}


#pragma mark Subscription handling

-(void) mSubscribe {

	[_pViewController mViewInProgress];
	[_pDefaultPaymentQueue addPayment:[SKPayment paymentWithProduct:_pSubscriptionProduct]];
}

-(void) mRestore {

	[_pDefaultPaymentQueue restoreCompletedTransactions];
}

#pragma mark SKProductsRequestDelegate

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {

	_pSubscriptionProduct = response.products[0];
	[_pViewController mViewSubscribe:[NSString stringWithFormat:
		@"Subscribe %@%@",
		_pSubscriptionProduct.price,
		_pSubscriptionProduct.priceLocale.currencySymbol
	]];
}


#pragma mark SKPaymentTransactionObserver

-(void) paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions {

	for (SKPaymentTransaction *iTransaction in transactions) {
		switch (iTransaction.transactionState) {
			case SKPaymentTransactionStatePurchasing: {
				NSLog(@"Transaction Purchasing");
				break;
			}
			case SKPaymentTransactionStatePurchased: {
				NSLog(@"Transaction Purchased");
				NSURL *oReceiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
				NSData *oReceipt = [NSData dataWithContentsOfURL:oReceiptURL];
				NSLog(@"%@", oReceipt);
				[_pDefaultPaymentQueue finishTransaction:iTransaction];
				[_pViewController mViewSubscribed:@"You've subscribed"];
				break;
			}
			case SKPaymentTransactionStateFailed: {
				NSLog(@"Transaction  Failed: %@",iTransaction.error.localizedDescription);
				[_pDefaultPaymentQueue finishTransaction:iTransaction];
			}
			case SKPaymentTransactionStateRestored: {
				NSLog(@"Restored: %@",iTransaction.payment.productIdentifier);
				[_pDefaultPaymentQueue finishTransaction:iTransaction];
			}
			case SKPaymentTransactionStateDeferred: {
				NSLog(@"Transaction Deferred");
				break;
			}
			default: {
				break;
			}
		}
	}
}

@end

#include "SubscriptionBackend.hpp"
#include <QtCore/qglobal.h>
#include "aglobal.h"

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#define SUBS_PRODUCT_ID @"local.bogong.subscription"

@interface SubscriptionHandler: NSObject <SKProductsRequestDelegate,SKPaymentTransactionObserver>

@property (nonatomic,strong) SKProduct *pSubscriptionProduct;
@property (nonatomic,strong) SKPaymentQueue *pDefaultPaymentQueue;

-(void) mTest;

@end

@implementation SubscriptionHandler

-(instancetype) init {

	self = [super init];
	if (self) {
		if([SKPaymentQueue canMakePayments]) {
			aLOG << "You can pay";
		} else {
			aLOG << "You can't pay";
			return self;
		}
		_pDefaultPaymentQueue = [SKPaymentQueue defaultQueue];
		[_pDefaultPaymentQueue addTransactionObserver:self];
		SKProductsRequest *oRequest = [[SKProductsRequest alloc]
			initWithProductIdentifiers:[NSSet setWithObject:SUBS_PRODUCT_ID]
		];
		oRequest.delegate = self;
		[oRequest start];
		aLOG << "SubscriptionHandler initiated";
	}
	return self;
}

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {

	_pSubscriptionProduct = response.products[0];
	aLOG << [[NSString stringWithFormat:
		@"Subscribe %@%@",
		_pSubscriptionProduct.price,
		_pSubscriptionProduct.priceLocale.currencySymbol
	] UTF8String];
}

-(void) paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions {

	for (SKPaymentTransaction *iTransaction in transactions) {
		switch (iTransaction.transactionState) {
			case SKPaymentTransactionStatePurchasing: {
				aLOG << "Transaction Purchasing";
				break;
			}
			case SKPaymentTransactionStatePurchased: {
				aLOG << "Transaction Purchased";
				NSURL *oReceiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
				NSData *oReceipt = [NSData dataWithContentsOfURL:oReceiptURL];
				aLOG << oReceipt;
				[_pDefaultPaymentQueue finishTransaction:iTransaction];
				break;
			}
			case SKPaymentTransactionStateFailed: {
				aLOG << "Transaction  Failed: %@";
				[_pDefaultPaymentQueue finishTransaction:iTransaction];
			}
			case SKPaymentTransactionStateRestored: {
				aLOG << "Restored: %@";
				[_pDefaultPaymentQueue finishTransaction:iTransaction];
			}
			case SKPaymentTransactionStateDeferred: {
				aLOG << "Transaction Deferred";
				break;
			}
			default: {
				break;
			}
		}
	}
}


-(void) mTest {
	aLOG << "mTest";
	NSLog(@"SubscriptionHandler::mTest");
}

@end

QT_BEGIN_NAMESPACE

SubscriptionBackend::SubscriptionBackend(void) {
	aLOG << "SubscriptionBackend::SubscriptionBackend(void)";
}

SubscriptionBackend::~SubscriptionBackend(void) {
	aLOG << "SubscriptionBackend::~SubscriptionBackend(void)";
}

void SubscriptionBackend::mGetProduct(void) {

	NSLog(@"void SubscriptionBackend::mGetProduct(void)");
	SubscriptionHandler *oHandler = [[SubscriptionHandler alloc] init];
	[oHandler mTest];
}

QT_END_NAMESPACE





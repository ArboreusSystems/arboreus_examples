//
//  Subscription.swift
//  Subscription
//
//  Created by Alexandr Kirilov on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit
import StoreKit

class Subscription: NSObject {

	let pSubscriptionProductID = "arboreus.swift.subscription";
	var pSubscriptionProduct: Optional<SKProduct> = nil;
	var pStatus: Bool = false;

	override init() {

		super.init();

		let oRequest: SKProductsRequest = SKProductsRequest(
			productIdentifiers: [pSubscriptionProductID]
		);
		oRequest.delegate = self;
		oRequest.start();
	}

	func mSubscribe() -> Bool {

		return true;
	}
}

extension Subscription: SKProductsRequestDelegate {

	func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {

		pSubscriptionProduct = response.products[0];
		print("Title: \(pSubscriptionProduct!.localizedTitle)");
		print("Description: \(pSubscriptionProduct!.localizedDescription)");
		print("Price: \(pSubscriptionProduct!.price)\(pSubscriptionProduct!.priceLocale.currencySymbol!)");
	}
}

extension Subscription: SKPaymentTransactionObserver {

	func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {


	}
}
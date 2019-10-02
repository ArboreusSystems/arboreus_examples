//
//  Subscription.swift
//  Subscription
//  This is only starter example it's not full featured solution.
//
//  There need to be implemented
//      * checking and storing receipt
//      * validating the time of subscription from receipt
//      * add the Subscription View Controller correct reactions
//
//  Before building this example define your product in iTunes Connect
//  Define Subscription Product ID in the code below
//
//  Created by Alexandr Kirilov on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit
import Foundation
import StoreKit

class Subscription: NSObject {

	private static var pInstance: Optional<Subscription> = nil;
	private var pViewController: Optional<SubscriptionViewController> = nil;

	let pSubscriptionProductID: String = "local.bogong.subscription";
	var pSubscriptionAbility: Bool = false;
	var pSubscriptionProduct: Optional<SKProduct> = nil;
	let pPaymentQueue: SKPaymentQueue = SKPaymentQueue.default();

	class var mGetInstance: Subscription {
		guard let oInstance = self.pInstance else {
			let oInstance = Subscription();
			self.pInstance = oInstance;
			let oRequest: SKProductsRequest = SKProductsRequest(
				productIdentifiers: [pInstance!.pSubscriptionProductID]
			);
			oRequest.delegate = pInstance!;
			oRequest.start();
			pInstance!.pPaymentQueue.add(pInstance!);
			return oInstance;
		}
		return oInstance;
	}

	func mSetViewController(inViewController: SubscriptionViewController) -> Void {

		pViewController = inViewController;
	}

	func mCheckCanPayments() -> Bool {

		if (!SKPaymentQueue.canMakePayments()) {
			if (pViewController != nil) {
				pViewController!.mViewNotAvailable();
				return true;
			}
		}
		return false;
	}

	func mSubscribe() -> Void {

		print("mSubscribe()");
		let oPayment: SKPayment = SKPayment(product: pSubscriptionProduct!);
		pPaymentQueue.add(oPayment);
	}

	func mRestore() {

		print("mRestore()");
		pPaymentQueue.restoreCompletedTransactions();
	}
}

extension Subscription: SKProductsRequestDelegate {

	func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {

		pSubscriptionProduct = response.products[0];
		if (pSubscriptionProduct!.subscriptionPeriod!.unit.rawValue > 0) {
			pViewController?.mViewSubscribed();
		} else {
			pViewController?.mViewSubscribe(inSubscriptionProduct: pSubscriptionProduct!);
		}
		print("Title: \(pSubscriptionProduct!.localizedTitle)");
		print("Description: \(pSubscriptionProduct!.localizedDescription)");
		print("Price: \(pSubscriptionProduct!.price)\(pSubscriptionProduct!.priceLocale.currencySymbol!)");
		print("Subscription period unit raw value:",pSubscriptionProduct!.subscriptionPeriod!.unit.rawValue);
		print("Subscription period unit hash value:",pSubscriptionProduct!.subscriptionPeriod!.unit.hashValue);
	}
}

extension Subscription: SKPaymentTransactionObserver {

	func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {

		for iTransaction in transactions {
			print("Transaction State: \(iTransaction.transactionState)");
			print("Product: \(iTransaction.payment.productIdentifier) -> \(iTransaction.transactionState.mStatus())");
			switch iTransaction.transactionState {
				case .purchasing: break;
				case .purchased:
					pViewController?.mViewSubscribed();
					queue.finishTransaction(iTransaction);
					break;
				case .restored:
					pViewController?.mViewSubscribed();
					queue.finishTransaction(iTransaction);
					break;
				default: queue.finishTransaction(iTransaction);
			}
		}
	}
}

extension SKPaymentTransactionState {

	func mStatus() -> String {

		switch self {
			case .deferred: return "deferred";
			case .failed: return "failed";
			case .purchased: return "purchased";
			case .purchasing: return "purchasing";
			case .restored: return "restored";
			default: return "default";
		}
	}
}

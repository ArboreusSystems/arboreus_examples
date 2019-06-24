//
//  SubscriptionView.swift
//  Subscription
//
//  Created by Alexandr Kirilov on 2019-06-23.
//  Copyright © 2019 none. All rights reserved.
//

import StoreKit

protocol SubscriptionView {

	func mViewSubscribe(inSubscriptionProduct: SKProduct) -> Void;
	func mViewNotAvailable() -> Void;
	func mViewSubscribed() -> Void;
}

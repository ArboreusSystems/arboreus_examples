//
//  AStoreKit2Products.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import Foundation
import StoreKit

class AStoreKit2Products: NSObject {

	var pConsumable: Array<Product> = [];
	var pNonConsumable: Array<Product> = [];
	var pRenewableSubscription: Array<Product> = [];
	var pNonRenewableSubscription: Array<Product> = [];
	
	func mGetAll() -> Array<Product> {
		
		return (
			pConsumable +
			pNonConsumable +
			pRenewableSubscription +
			pNonRenewableSubscription
		);
	}
}

//
//  AStoreKit2Products.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import Foundation
import StoreKit

class AStoreKit2Products: NSObject {

	var pConsumable: Set<Product> = [];
	var pNonConsumable: Set<Product> = [];
	var pRenewableSubscription: Set<Product> = [];
	var pNonRenewableSubscription: Set<Product> = [];
	
	func mGetAll() -> Set<Product> {
	
		var oAllProducts: Set<Product> = pConsumable;
		oAllProducts = oAllProducts.union(pNonConsumable);
		oAllProducts = oAllProducts.union(pRenewableSubscription);
		oAllProducts = oAllProducts.union(pNonRenewableSubscription);
		
		return oAllProducts;
	}
}

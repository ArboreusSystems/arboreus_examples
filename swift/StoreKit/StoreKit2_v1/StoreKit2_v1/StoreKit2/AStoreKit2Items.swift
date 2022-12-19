//
//  AStoreKit2Items.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import Foundation

class AStoreKit2Items: NSObject {

	let pConsumable: Set<String> = [
		"systems.arboreus.test.StoreKit.Item.Consumable.00",
		"systems.arboreus.test.StoreKit.Item.Consumable.01"
	];
	let pNonConsumable: Set<String> = [
		"systems.arboreus.test.StoreKit.Item.NonConsumable.00",
		"systems.arboreus.test.StoreKit.Item.NonConsumable.01",
		"systems.arboreus.test.StoreKit.Item.NonConsumable.02"
	];
	let pRenewableSubscription: Set<String> = [
		"systems.arboreus.test.StoreKit.Subscription.Renewable.week.1",
		"systems.arboreus.test.StoreKit.Subscription.Renewable.month.1",
		"systems.arboreus.test.StoreKit.Subscription.Renewable.month.2"
	];
	let pNonRenewableSubscription: Set<String> = [
		"systems.arboreus.test.StoreKit.Subscription.NonRenewable.week.1",
		"systems.arboreus.test.StoreKit.Subscription.NonRenewable.week.2"
	];
	
	func mGetAll() -> Set<String> {
	
		var oAllProducts: Set<String> = pConsumable;
		oAllProducts = oAllProducts.union(pNonConsumable);
		oAllProducts = oAllProducts.union(pRenewableSubscription);
		oAllProducts = oAllProducts.union(pNonRenewableSubscription);
		
		return oAllProducts;
	}
}

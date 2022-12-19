//
//  AStoreKit2.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import Foundation
import StoreKit

@objcMembers class AStoreKit2: NSObject {
	
	let pItems: AStoreKit2Items = AStoreKit2Items();
	var pProducts: AStoreKit2Products = AStoreKit2Products();
	
	static let pSharedInstance: AStoreKit2 = AStoreKit2();
	
	override init() {
		
		super.init();
		
		__ALog("AStoreKit2 created");
	}
	
	func mGetProducts() async -> Void {
		
		__ALog("Requesting products");
		
		pProducts.pConsumable.removeAll();
		pProducts.pNonConsumable.removeAll();
		pProducts.pRenewableSubscription.removeAll();
		pProducts.pNonRenewableSubscription.removeAll();
		
		do {
			let oProducts: [Product] = try await Product.products(for: pItems.mGetAll());
			for iProduct in oProducts {
				switch iProduct.type {
					case .consumable: pProducts.pConsumable.insert(iProduct);
					case .nonConsumable: pProducts.pNonConsumable.insert(iProduct);
					case .autoRenewable: pProducts.pRenewableSubscription.insert(iProduct);
					case .nonRenewable: pProducts.pNonRenewableSubscription.insert(iProduct);
					default: __ALog("Error! Wrong product type");
				}
			}
			__ALog("Consumable products");
			for iConsumable in pProducts.pConsumable {
				__ALog("\(iConsumable.id) \(iConsumable.price)");
			}
			__ALog("NonConsumable products");
			for iNonConsumable in pProducts.pNonConsumable {
				__ALog("\(iNonConsumable.id) \(iNonConsumable.price)");
			}
			__ALog("ReneableSubscription products");
			for iRenewableSubscription in pProducts.pRenewableSubscription {
				__ALog("\(iRenewableSubscription.id) \(iRenewableSubscription.price)");
			}
			__ALog("NonReneableSubscription products");
			for iNonRenewableSubscription in pProducts.pNonRenewableSubscription {
				__ALog("\(iNonRenewableSubscription.id) \(iNonRenewableSubscription.price)");
			}
		} catch {
			__ALog("Error in getting products");
		}
	}
}

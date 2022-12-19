//
//  AStoreKit2.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import Foundation
import StoreKit

@objcMembers class AStoreKit2: NSObject {
	
	let oItems: AStoreKit2Items = AStoreKit2Items();
	var oProducts: AStoreKit2Products = AStoreKit2Products();
	
	static let pSharedInstance: AStoreKit2 = AStoreKit2();
	
	func mGetProducts() -> Void {
		
	}
}

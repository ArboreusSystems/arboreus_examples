//
//  AStoreKitHandler.swift
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 04/01/2023.
//

import Foundation
import StoreKit


@objc class AStoreKitHandler: NSObject {

	override init() {
		
		super.init()
	}
	
	@objc func mRequestProducts(inIDs:Array<String>) async throws -> Array<AStoreKitHandlerProduct> {
		
		var oOutput: Array<AStoreKitHandlerProduct> = [];
		let oProducts: [Product] = try await Product.products(for:inIDs);
		for iProduct in oProducts {
		
			let iStoreKitHandlerProduct: AStoreKitHandlerProduct = AStoreKitHandlerProduct();
			iStoreKitHandlerProduct.pID = iProduct.id as NSString;
			iStoreKitHandlerProduct.pName = iProduct.displayName as NSString;
			iStoreKitHandlerProduct.pDescription = iProduct.description as NSString;
			iStoreKitHandlerProduct.pPrice = iProduct.price as NSNumber;
		
			switch iProduct.type {
				case .consumable: iStoreKitHandlerProduct.pType = .Consumable; break;
				case .nonConsumable: iStoreKitHandlerProduct.pType = .NonConsumable; break;
				case .autoRenewable: iStoreKitHandlerProduct.pType = .RenewableSubscription; break;
				case .nonRenewable: iStoreKitHandlerProduct.pType = .NonRenewableSubscription; break;
				default: break;
			}
			
			oOutput.append(iStoreKitHandlerProduct);
		}

		return oOutput;
	}
	
	@objc func mBuyProduct(inID:String) async throws -> Void {
	
	}
}

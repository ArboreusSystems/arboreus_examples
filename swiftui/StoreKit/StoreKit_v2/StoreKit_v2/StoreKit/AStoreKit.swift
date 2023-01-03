//
//  AStoreKit.swift
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 03/01/2023.
//

import Foundation
import StoreKit


class AStorekit: ObservableObject {

	static let pSharedInstance: AStorekit = AStorekit();
	private var pUpdates: Optional<Task<Void, Never>> = nil;

	let pProductIDS: [String] = [
		"systems.arboreus.test.StoreKit.Subscription.Renewable.week.1",
		"systems.arboreus.test.StoreKit.Subscription.Renewable.month.1",
		"systems.arboreus.test.StoreKit.Subscription.Renewable.month.2"
	];
	
	init() {
		
		pUpdates = mObserveTransactionsUpdate();
	}
	
	deinit {
		
		pUpdates?.cancel();
	}
	
	func mLoadProducts() async throws -> [Product] {
		
		var oProducts: [Product] = [];
		oProducts = try await Product.products(for: self.pProductIDS);
		return oProducts;
	}
	
	func mPurchaseProduct(inProduct: Product) async throws -> Void {
		
		let oResult = try await inProduct.purchase();
		switch oResult {
			case let .success(.verified(sTransaction)):
				// Successful purhcase
				await sTransaction.finish();
				__ALog("Purchased product: \(inProduct.id)");
				break;
			case let .success(.unverified(_, sError)):
				// Successful purchase but transaction/receipt can't be verified
				// Could be a jailbroken phone
				__ALog("ERROR! Purchased product: \(inProduct.id) NOT verified with: \(sError.localizedDescription)");
				break;
			case .pending:
				// Transaction waiting on SCA (Strong Customer Authentication) or
				// approval from Ask to Buy
				__ALog("Pending purchase transaction for: \(inProduct.id)");
				break;
			case .userCancelled:
				__ALog("User canceled purchase: \(inProduct.id)");
				break;
    		default:
    			break;
    	}
	}
	
	private func mObserveTransactionsUpdate() -> Task<Void,Never> {
		
		Task(priority: .background) { [unowned self] in
			
			for await iVerificationResult in Transaction.updates {
				__ALog("Updated transaction")
				__ALog("\(iVerificationResult.payloadData)");
				self.mUpdateProducts();
			}
		}
	}
	
	private func mUpdateProducts() -> Void {
		
		__ALog("Update Products");
	}
	
}


//
//  AStoreKit.swift
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 02/01/2023.
//

import Foundation
import StoreKit

class AStoreKit: ObservableObject {

	let pSubscriptionID: String = "systems.arboreus.test.StoreKit.Subscription.Renewable.week.1";
	@Published var pSubscriptionProduct: Optional<Product> = nil;

	func mFetchSubscription() {
		
		Task {
			do {
				__ALog("Fetching Subscription");
				let oProducts: Array<Product> = try await Product.products(for: [self.pSubscriptionID]);
				DispatchQueue.main.async { [self] in
					self.pSubscriptionProduct = oProducts.first;
					__ALog(pSubscriptionProduct!);
				}
			} catch {
				__ALog("ERROR! Getting subscription product failed");
			}
		}
	}
	
	func mBuySubscription() {
		
		guard (pSubscriptionProduct != nil) else {
			__ALog("ERROR! No Subscription product");
			return;
		}
		
		Task {
			do {
			
				let oResult = try await pSubscriptionProduct?.purchase();
				switch oResult {
					case let .success(.verified(sTransaction)):
						// Successful purhcase
						__ALog("Transaction success, verified");
						await sTransaction.finish();
						break;
					case let .success(.unverified(_,sError)):
       					// Successful purchase but transaction/receipt can't be verified
       					// Could be a jailbroken phone
       					__ALog("Transaction success, NOT verified with: \(sError.localizedDescription)");
						break;
    				case .pending:
    					// Transaction waiting on SCA (Strong Customer Authentication) or
    					// approval from Ask to Buy
    					__ALog("Transaction pending");
    					break;
					case .userCancelled:
						__ALog("Transaction canceled");
						break;
    				default:
    					__ALog("Transaction undefined");
        				break;
    			}
    			
			} catch {
				__ALog("ERROR! Buying Subscription failed");
			}
		}
	}
}

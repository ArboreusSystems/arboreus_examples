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
	private var pTransactionUpdates: Optional<Task<Void, Never>> = nil;
	
	static let pSharedInstance: AStoreKit2 = AStoreKit2();
	
	override init() {
		
		super.init();
		
		pTransactionUpdates = mObserveTransactionsUpdate();
		
		__ALog("AStoreKit2 created");
	}
	
	deinit {
	
		pTransactionUpdates?.cancel();
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
					case .consumable: pProducts.pConsumable.append(iProduct);
					case .nonConsumable: pProducts.pNonConsumable.append(iProduct);
					case .autoRenewable: pProducts.pRenewableSubscription.append(iProduct);
					case .nonRenewable: pProducts.pNonRenewableSubscription.append(iProduct);
					default: __ALog("Error! Wrong product type");
				}
				
				__ALog(String(
					data: Data(
						base64Encoded: iProduct.jsonRepresentation.base64EncodedData(),
						options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!,
					encoding: .utf8
				)!);
			}
			__ALog("Consumable products");
			for iConsumable in pProducts.pConsumable {
				__ALog("\(iConsumable.id) \(iConsumable.price) \(iConsumable.type) \(iConsumable.type.hashValue)");
			}
			__ALog("NonConsumable products");
			for iNonConsumable in pProducts.pNonConsumable {
				__ALog("\(iNonConsumable.id) \(iNonConsumable.price) \(iNonConsumable.type) \(iNonConsumable.type.hashValue)");
			}
			__ALog("ReneableSubscription products");
			for iRenewableSubscription in pProducts.pRenewableSubscription {
				__ALog("\(iRenewableSubscription.id) \(iRenewableSubscription.price) \(iRenewableSubscription.type) \(iRenewableSubscription.type.hashValue)");
			}
			__ALog("NonReneableSubscription products");
			for iNonRenewableSubscription in pProducts.pNonRenewableSubscription {
				__ALog("\(iNonRenewableSubscription.id) \(iNonRenewableSubscription.price) \(iNonRenewableSubscription.type) \(iNonRenewableSubscription.type.hashValue)");
			}
		} catch {
			__ALog("Error in getting products");
		}
	}
	
	func mPurchaseProduct(_ inProduct: Product) async throws -> Void {
		
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
	
	func mUpdatePurchasedProducts(_ inTransaction: Transaction) -> Void {
		
		
	}
	
	func mIsPurchasedProduct(_ inProductID: String) async throws -> Bool {
		
		return false;
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

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
	
	func mPurchaseProduct(_ inProduct: Product) async throws -> Optional<Transaction> {
		
		let oResult = try await inProduct.purchase();
		switch oResult {
			case .success(let verification):
				__ALog("Purchase success");
//				let oTransaction = mCheckVerified(oResult);
//				return oTransaction;
			case .pending:
				__ALog("Purchase pending");
			case .userCancelled:
        		__ALog("Purchase canceled by user");
			default:
				break;
		}
		return nil;
	}
	
	func mCheckVerified<Transaction>(_ inResult: VerificationResult<Transaction>) throws -> Transaction {
		
		var oTransaction: Transaction;
		
		switch inResult {
			case .unverified(let sTransaction, let sError):
				__ALog("Error! Transaction not verified: \(sError.localizedDescription)");
				oTransaction = sTransaction;
				throw sError;
			case .verified(let sTransaction):
				__ALog("Transaction verified");
				oTransaction = sTransaction;
		}
		
		return oTransaction;
	}
	
	func mUpdatePurchasedProducts(_ inTransaction: Transaction) -> Void {
		
		
	}
	
	func mIsPurchasedProduct(_ inProductID: String) async throws -> Bool {
		
		return false;
	}
}

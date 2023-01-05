//
//  AStoreKitHandler.swift
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 04/01/2023.
//

import Foundation
import StoreKit


@objc class AStoreKitHandler: NSObject {
	
	@objc weak var pDelegate: Optional<AStorekitHandlerDelegate> = nil;
	private var pProducts: Dictionary<String,Product> = [:];
	private var pUpdates: Optional<Task<Void, Never>> = nil;
	
	override init() {
		
		super.init();
		pUpdates = self.mObserveTransactionsUpdate();
	}
	
	deinit {
		
		pUpdates?.cancel();
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
			self.pProducts[iProduct.id] = iProduct;
		}

		return oOutput;
	}
	
	@objc func mBuyProduct(inID:String) async throws -> Void {
		
		let oProduct: Product = self.pProducts[inID]!;
		let oResult: Product.PurchaseResult = try await oProduct.purchase();
		
		let oStoreKitHandlerProduct: AStoreKitHandlerProduct = AStoreKitHandlerProduct();
		oStoreKitHandlerProduct.pID = oProduct.id as NSString;
		oStoreKitHandlerProduct.pName = oProduct.displayName as NSString;
		oStoreKitHandlerProduct.pDescription = oProduct.description as NSString;
		oStoreKitHandlerProduct.pPrice = oProduct.price as NSNumber;
		
		switch oResult {
			case let .success(.verified(sTransaction)):
				await sTransaction.finish();
				pDelegate?.mBuyProductSuccessVerified(inProduct: oStoreKitHandlerProduct);
				break;
			case let .success(.unverified(_, sError)):
				pDelegate?.mBuyProductSuccessNotVerified(inProduct: oStoreKitHandlerProduct, inError: sError);
				break;
			case .pending:
				pDelegate?.mBuyProductPending(inProduct: oStoreKitHandlerProduct);
				break;
			case .userCancelled:
				pDelegate?.mBuyProductUserCanceled(inProduct: oStoreKitHandlerProduct);
				break;
    		default:
    			pDelegate?.mBuyProductUndefinedResult(inProduct: oStoreKitHandlerProduct);
    			break;
    	}
	}
	
	private func mObserveTransactionsUpdate() -> Task<Void,Never> {
		
		Task(priority: .background) { [unowned self] in
			
			var oHandlerTransaction: AStoreKitHandlerTransaction;
			
			for await iVerificationResult: VerificationResult<Transaction> in Transaction.updates {
				oHandlerTransaction = AStoreKitHandlerTransaction.mFromTransaction(inResult: iVerificationResult);
				pDelegate?.mTransactionUpdates(inTransaction: oHandlerTransaction);
			}
		}
	}
}

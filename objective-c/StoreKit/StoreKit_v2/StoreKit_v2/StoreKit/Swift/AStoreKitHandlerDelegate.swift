//
//  AStoreKitHandlerDelegate.swift
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 05/01/2023.
//

import Foundation

@objc protocol AStorekitHandlerDelegate {

	@objc func mBuyProductSuccessVerified(inProduct:AStoreKitHandlerProduct) -> Void;
	@objc func mBuyProductSuccessNotVerified(inProduct:AStoreKitHandlerProduct, inError: Error) -> Void;
	@objc func mBuyProductPending(inProduct:AStoreKitHandlerProduct) -> Void;
	@objc func mBuyProductUserCanceled(inProduct:AStoreKitHandlerProduct) -> Void;
	@objc func mBuyProductUndefinedResult(inProduct:AStoreKitHandlerProduct) -> Void;
	@objc func mTransactionUpdates(inTransaction:AStoreKitHandlerTransaction) -> Void;
}

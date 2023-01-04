//
//  AStoreKitHandlerDataModels.swift
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 04/01/2023.
//

import Foundation

@objc enum AStoreKitHandlerProductType: Int {
	
	case Wrong = 0;
	case Consumable = 1;
	case NonConsumable = 2;
	case RenewableSubscription = 3;
	case NonRenewableSubscription = 4;
}

@objc class AStoreKitHandlerProduct: NSObject {

	@objc var pID: NSString = "NoID";
	@objc var pName: NSString = "NoName";
	@objc var pDescription: NSString = "NoDescription";
	@objc var pPrice: NSNumber = 0.0;
	@objc var pType: AStoreKitHandlerProductType = .Wrong;
}

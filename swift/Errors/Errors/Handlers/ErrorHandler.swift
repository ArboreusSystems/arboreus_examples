//
//  ErrorHandler.swift
//  Errors
//
//  Created by Alexandr Kirilov on 09/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class ErrorHandler: NSObject {

	let oAlert: AlertHandler = AlertHandler();
	let oNetwork: NetworkHandler = NetworkHandler();
	
	override init() {
		
		super.init();
	}
	
	func mTapTrap() -> Void {
		
		fatalError("Fatal error from ErrorHandler:mTapTrap()");
	}
	
	func mTapOptional() -> Void {
		
		// let oTestValue: Optional<Any> = true;
		let oTestValue: Optional<Any> = nil;
		guard let oNotOptionalValue = oTestValue else {
			AlertHandler.mCreate(inMessage: "Value not presented");
			return;
		}
		print(oNotOptionalValue);
	}
	
	func mTapNetwork() -> Void {
		
		oNetwork.mMakeRequest { (result) in
			switch result {
				case .success(let inMessage):
					print(inMessage);
				case .failure(let inError):
					AlertHandler.mCreate(inMessage: inError.localizedDescription);
			}
		}
	}
}

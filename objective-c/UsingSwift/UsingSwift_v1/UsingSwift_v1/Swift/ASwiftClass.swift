//
//  ASwiftClass.swift
//  UsingSwift_v1
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

import Foundation

class ASwiftClass: NSObject {
	
	override init() {
		
		super.init();
		NSLog("ASwiftClass created");
	}
	
	@objc func mTestString() -> NSString {
		
		let oTestString: NSString = "ASwiftClassTestString";
		return oTestString;
	}
}


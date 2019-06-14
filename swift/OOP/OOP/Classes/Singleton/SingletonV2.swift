//
//  SingletonV2.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-14.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class SingletonV2  {

	private static var pInstance: Optional<SingletonV2> = nil;
	var pTestString: String = "Default init value";

	class var mGetInstance : SingletonV2 {
		guard let oInstance = self.pInstance else {
			let oInstance = SingletonV2();
			self.pInstance = oInstance;
			return oInstance;
		}
		if (pInstance != nil) {
			print("Singleton instance of \(String(describing:oInstance)) created");	
		} else {
			print("Singleton instance of \(String(describing:oInstance)) NOT created");
		}

		return oInstance;
	}

	class func mDeinit() {
		pInstance = nil;
		if (pInstance != nil) {
			print("Singleton instance of \(String(describing:pInstance)) NOT deleted");
		} else {
			print("Singleton instance of \(String(describing:pInstance)) deleted");
		}
	}

	private init() {}
}

extension SingletonV2: NSCopying {

	func copy(with zone: NSZone? = nil) -> Any {
		return self
	}
}
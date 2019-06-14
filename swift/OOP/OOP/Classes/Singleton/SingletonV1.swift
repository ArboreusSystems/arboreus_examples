//
//  SingletonV1.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-13.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class SingletonV1 {

	var pTestString: String = String();

	static var pInstance: SingletonV1 = {
		let instance = SingletonV1();
		instance.pTestString = "Default value";
		print("Singleton instance of \(String(describing: instance)) created");
		return instance;
	}()

	private init() {}
}

extension SingletonV1: NSCopying {

	func copy(with zone: NSZone? = nil) -> Any {
		return self
	}
}
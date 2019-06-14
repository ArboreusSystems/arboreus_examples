//
//  Final.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-13.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

final class Final: NSObject {

	var pTestString: Optional<String> = nil;
	private var pTestPrivateString: Optional<String> = nil;

	override init() {

		super.init();
		pTestString = "pTestString Init Value"; 
		print("Class: \(String(describing: self)) created");
	}

	func mSetPrivateString(inValue: String) -> Void {

		pTestPrivateString = inValue;
	}

	func mGetPrivateString() -> Optional<String> {

		return pTestPrivateString;
	}

	deinit {

		print("Class: \(String(describing: self)) deleted");
	}
}

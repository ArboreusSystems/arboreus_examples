//
//  AdapterV1Target.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-14.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

protocol AdapterV1Protocol {

	func mSetPTestString(inString: String) -> Void;
	func mGetPTestString() -> String;
}

class AdapterV1Target: AdapterV1Protocol {

	private var pTestString: String = "String from AdapterV1Target";

	func mSetPTestString(inString: String) -> Void {

		pTestString = inString;
	}

	func mGetPTestString() -> String {

		return pTestString;
	}
}

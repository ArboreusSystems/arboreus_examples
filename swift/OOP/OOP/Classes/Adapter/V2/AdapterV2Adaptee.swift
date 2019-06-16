//
//  AdapterV2Adaptee.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-14.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class AdapterV2Adaptee {

	private var pTestString: String = "Default init value";

	func mSetup(inString: String) -> Void {

		pTestString = inString;
	}

	func mRead() -> String {

		return pTestString;
	}

}

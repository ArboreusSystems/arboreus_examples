//
//  AdapterV1.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-14.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class AdapterV1: AdapterV1Protocol {

	private let pAdaptee: AdapterV1Adaptee = AdapterV1Adaptee();

	func mGetPTestString() -> String {
		return pAdaptee.mGetString();
	}

	func mSetPTestString(inString: String) -> Void {
		pAdaptee.pString = inString;
	}
}

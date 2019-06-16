//
//  AdapterV2Target.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-14.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

protocol AdapterV2Protocol {

	func mSetPTestString(inAdaptee: inout AdapterV2Adaptee, inString: String) -> Void;
	func mGetPTestString(inAdaptee: inout AdapterV2Adaptee) -> String;
}

class AdapterV2Target {

	var oTestString: String = "Default string from target";

	func mGetString() -> String {

		return oTestString;
	}

	func mSetString(inString: String) -> Void {

		oTestString = inString;
	}

}

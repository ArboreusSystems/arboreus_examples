//
//  AdapterV2.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-14.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class AdapterV2: AdapterV2Protocol {

	func mSetPTestString(inAdaptee: inout AdapterV2Adaptee, inString: String) -> Void {

		inAdaptee.mSetup(inString: inString);
	}

	func mGetPTestString(inAdaptee: inout AdapterV2Adaptee) -> String {

		return inAdaptee.mRead();
	}

}

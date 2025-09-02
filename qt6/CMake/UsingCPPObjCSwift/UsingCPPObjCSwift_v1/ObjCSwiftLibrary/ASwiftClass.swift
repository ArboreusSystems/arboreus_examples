//
//  ASwiftClass.swift
//  ObjCSwiftLibrary
//
//  Created by Alexandr Kirilov on 02/09/2025.
//

import Foundation

@objc public class ASwiftClass: NSObject {

	@objc public func mTestText() -> NSString {

		let oText: NSString = "Text from Swift class";
		return oText;
	}
}

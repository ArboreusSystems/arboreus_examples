//
//  MainHandler.swift
//  Collections
//
//  Created by Alexandr Kirilov on 10/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

enum DictionaryTypes {
	case Numeric
	case AlphaLower
	case AlphaUpper
	case Symbols
}

enum DictionaryReturnMode {
	case String
	case Array
}

class MainHandler: NSObject {

	static func mRandomString(inLength:UInt,inDictionary:String) -> String {
		
		return String((0..<inLength).map{ _ in inDictionary.randomElement()! });
	}
	
	static func mStringDictionary(inDictionaryTypes: [DictionaryTypes]) -> String {
		
		let oNumeric: String = "0123456789";
		let oAlphaLower: String = "abcdefghijklmnopqrstuvwxyz";
		let oAlphaUpper: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		let oSymbols: String = "±!@#$%^&*()_+ ~?><|\":}{;,./;'`";
		
		var oOutput: String = "";
		
		for iType in inDictionaryTypes {
			if (iType == DictionaryTypes.Numeric) {oOutput = oOutput + oNumeric;}
			if (iType == DictionaryTypes.AlphaLower) {oOutput = oOutput + oAlphaLower;}
			if (iType == DictionaryTypes.AlphaUpper) {oOutput = oOutput + oAlphaUpper;}
			if (iType == DictionaryTypes.Symbols) {oOutput = oOutput + oSymbols;}
		}
		
		return oOutput;
	}
}

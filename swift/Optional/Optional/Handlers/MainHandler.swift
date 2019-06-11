//
//  MainHandler.swift
//  Optional
//
//  Created by Alexandr Kirilov on 11/06/2019.
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

struct Receipt {
    let Product: String
    let ProductID: String
    let Timestamp: Double
    let Description: String
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
	
	static func mGetReceiptFromServerEmulation() -> Optional<Receipt> {
		
		var oReceipt: Optional<Receipt> = nil;
		let oServerSuccess: Bool = Bool(truncating: (Int.random(in: 0...1) as NSNumber));
		let oDictionary: String = MainHandler.mStringDictionary(inDictionaryTypes:[
			DictionaryTypes.Numeric,
			DictionaryTypes.AlphaLower,
			DictionaryTypes.AlphaUpper
		]);
		if (oServerSuccess) {
			oReceipt = Receipt(
				Product: "Product" + MainHandler.mRandomString(inLength:6,inDictionary:oDictionary),
				ProductID: MainHandler.mRandomString(inLength:32,inDictionary:oDictionary),
				Timestamp: NSDate().timeIntervalSince1970,
				Description: "Description: " + MainHandler.mRandomString(inLength:64,inDictionary:oDictionary)
			);
		}
		return oReceipt;
	}
}

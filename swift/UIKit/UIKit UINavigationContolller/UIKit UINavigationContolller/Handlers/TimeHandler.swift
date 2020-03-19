//
//  TimeHandler.swift
//  UIKit UINavigationContolller
//
//  Created by Alexandr Kirilov on 19/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class TimeHandler: NSObject {
	
	static func mSecondsSince1970() -> Int64 {
		
		let oDate: Date = Date();
		return Int64(oDate.timeIntervalSince1970.rounded());
	}

	static func mMillisecondsSince1970() -> Int64 {
		
		let oDate: Date = Date();
		return Int64((oDate.timeIntervalSince1970 * 1000.0).rounded());
	}
	
	static func mMicroSecondsSince1970() -> Int64 {
		
		let oDate: Date = Date();
		return Int64((oDate.timeIntervalSince1970 * 1000000.0).rounded());
	}
}

//
//  TimeHandler.swift
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 01/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class TimeHandler: NSObject {

	static func mTimeIntervalSince1970Seconds() -> Int64 {
		
		return Int64(Date().timeIntervalSince1970);
	}
	
	static func mTimeIntervalSince1970Milliseconds() -> Int64 {
		
		return Int64((Date().timeIntervalSince1970 * 1000.0).rounded());
	}
	
	static func mTimeIntervalSince1970Microseconds() -> Int64 {
		
		return Int64((Date().timeIntervalSince1970 * 1000000.0).rounded());
	}
}

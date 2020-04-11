//
//  LogHandler.swift
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 01/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class LogHandler: NSObject {
	
	static func mMessage(
		_ inMessage: String,
		inClass: String,
		inFile: String = #file,
		inFunction: String = #function,
		inLine: Int = #line,
		inColumn: Int = #column
	) -> Void {
		
		print("\(TimeHandler.mTimeIntervalSince1970Microseconds()): \(inMessage) \(inClass).\(inFunction) \(inLine):\(inColumn) ");
	}
}


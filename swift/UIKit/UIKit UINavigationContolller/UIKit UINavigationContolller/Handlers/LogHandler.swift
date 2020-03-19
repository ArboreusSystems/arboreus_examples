//
//  LogHandler.swift
//  UIKit UINavigationContolller
//
//  Created by Alexandr Kirilov on 19/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class LogHandler: NSObject {
	
	static func mMessage(
		_ inMessage: String,
		inClass: String,
		inFile: String = #file,
		inFunction: String = #function,
		inLine: Int = #line
	) -> Void {
		
		print("\(TimeHandler.mMicroSecondsSince1970()) \(inMessage) \n\(inClass).\(inFunction) line: \(inLine)");
	}
}

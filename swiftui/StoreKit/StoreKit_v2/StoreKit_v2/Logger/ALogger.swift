//
//  ALogger.swift
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 03/01/2023.
//

import Foundation


func __ALog(_ inObject: Any, inFilePath:String = #file, inFunctionName:String = #function, inLineNumber:Int = #line){

#if DEBUG
	let oTime: UInt64 = UInt64(NSDate().timeIntervalSince1970 * 1000000);
	let oFileName = (inFilePath as NSString).lastPathComponent;
	print("\(oTime) \(inObject) [\(oFileName)][\(inFunctionName)][\(inLineNumber)]");
#endif
}

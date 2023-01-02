//
//  ALogger.swift
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 02/01/2023.
//

import Foundation


func __ALog(_ inObject: Any, inFilePath:String = #file, inFunctionName:String = #function, inLineNumber:Int = #line){

#if DEBUG
	let oTime: UInt64 = UInt64(NSDate().timeIntervalSince1970 * 1000000);
	let oFileName = (inFilePath as NSString).lastPathComponent;
	print("\(oTime) \(inObject) [\(oFileName)][\(inFunctionName)][\(inLineNumber)]");
#endif
}

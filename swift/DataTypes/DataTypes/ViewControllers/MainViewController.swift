//
//  MainViewController.swift
//  DataTypes
//
//  Created by Alexandr Kirilov on 10/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		
        let oInt: Int = 1234;
        print("Int Type: ",oInt);
        let oFloat: Float = 12.34;
        print("Float Type",oFloat);
        let oNSNumber: NSNumber = 345;
		print("NSNumber Type: ",oNSNumber);
		let oCGFloat: CGFloat = 1.23;
		print("CGFloat Type: ",oCGFloat);
		
		var vInt: Int = 0;
		for index in 0...5 {
			vInt = index;
			print("Variable Int: ",vInt);
		}
		
		let oIntMax: Int = Int.max;
		let oIntMin: Int = Int.min;
		print("Type Int -> max: ",oIntMax,", min: ",oIntMin);
		let oInt8Max: Int8 = Int8.max;
		let oInt8Min: Int8 = Int8.min;
		print("Type Int8 -> max: ",oInt8Max,", min: ",oInt8Min);
		let oInt16Max: Int16 = Int16.max;
		let oInt16Min: Int16 = Int16.min;
		print("Type Int16 -> max: ",oInt16Max,", min: ",oInt16Min);
		let oInt32Max: Int32 = Int32.max;
		let oInt32Min: Int32 = Int32.min;
		print("Type Int32 -> max: ",oInt32Max,", min: ",oInt32Min);
		let oInt64Max: Int64 = Int64.max;
		let oInt64Min: Int64 = Int64.min;
		print("Type Int64 -> max: ",oInt64Max,", min: ",oInt64Min);
		
		let oUIntMax: UInt = UInt.max;
		let oUIntMin: UInt = UInt.min;
		print("Type UInt -> max: ",oUIntMax,", min: ",oUIntMin);
		let oUInt8Max: UInt8 = UInt8.max;
		let oUInt8Min: UInt8 = UInt8.min;
		print("Type UInt8 -> max: ",oUInt8Max,", min: ",oUInt8Min);
		let oUInt16Max: UInt16 = UInt16.max;
		let oUInt16Min: UInt16 = UInt16.min;
		print("Type UInt16 -> max: ",oUInt16Max,", min: ",oUInt16Min);
		let oUInt32Max: UInt32 = UInt32.max;
		let oUInt32Min: UInt32 = UInt32.min;
		print("Type UInt32 -> max: ",oUInt32Max,", min: ",oUInt32Min);
		let oUInt64Max: UInt64 = UInt64.max;
		let oUInt64Min: UInt64 = UInt64.min;
		print("Type UInt64 -> max: ",oUInt64Max,", min: ",oUInt64Min);
		
        let oConstantNSString: NSString = "ConstantNSString";
        print("NSString Type: ",oConstantNSString);
        let oConstantString: String = "ConstantString";
		print("String Type: ",oConstantString);
		
		let oBoolTrue: Bool = true;
		print("Boolean true: ",oBoolTrue);
		let oBoolFalse: Bool = false;
		print("Boolean false: ",oBoolFalse);
		
		let oBoolTrueInt: Bool = Bool(truncating: 1);
		print("Boolean from Int true: ",oBoolTrueInt);
		let oBoolFalseInt: Bool = Bool(truncating: 0);
		print("Boolean from Int false: ",oBoolFalseInt);
		
		let oIntFromBool: Int = Int(truncating: true);
		print("Int from true: ",oIntFromBool);
		let oIntFromFalse: Int = Int(truncating: false);
		print("Int from false: ",oIntFromFalse);
		
		let oIntegerForCast: UInt = 25;
		print("Integer for cast:",oIntegerForCast);
		let oFloatForCast: Float = 35.35;
		print("Float for cast:",oFloatForCast);
		let oFloatSumOfIntegerAndFloat: Float = oFloatForCast + Float(oIntegerForCast);
		print("Float sum of Integer and Float:",oFloatSumOfIntegerAndFloat);
		let oIntegerSumOfIntegerAndFloat: UInt = oIntegerForCast + UInt(oFloatForCast);
		print("Integer sum of Integer and Float:",oIntegerSumOfIntegerAndFloat);
	}

	@IBAction func mButtonExit(_ sender: Any) {
		
		exit(0);
	}
}

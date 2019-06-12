//
//  MainViewController.swift
//  Syntax
//
//  Created by Alexandr Kirilov on 12/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

typealias MyInt = Int;

class MainViewController: UIViewController {

    override func viewDidLoad() {
		
        super.viewDidLoad()
		
		let oRandomFloat: Float = Float.random(in: 0...100);
		print("lroundf(\(oRandomFloat)) = \(lroundf(oRandomFloat))");
		print("round(\(oRandomFloat)) = \(round(oRandomFloat))");
		print("ceil(\(oRandomFloat)) = \(ceil(oRandomFloat))");
		print("floor(\(oRandomFloat)) = \(floor(oRandomFloat))");
		
		var oRandomIntegerA: Int = Int.random(in: 0...100);
		let oRandomIntegerB: Int = Int.random(in: 0...100);
		print("A(Int) + B(Int): \(oRandomIntegerA) + \(oRandomIntegerB) = \(oRandomIntegerA + oRandomIntegerB)");
		print("A(Int) - B(Int): \(oRandomIntegerA) - \(oRandomIntegerB) = \(oRandomIntegerA - oRandomIntegerB)");
		print("A(Int) * B(Int): \(oRandomIntegerA) * \(oRandomIntegerB) = \(oRandomIntegerA * oRandomIntegerB)");
		print("A(Int) / B(Int): \(oRandomIntegerA) / \(oRandomIntegerB) = \(oRandomIntegerA / oRandomIntegerB)");
		print("A(Int) % B(Int): \(oRandomIntegerA) % \(oRandomIntegerB) = \(oRandomIntegerA % oRandomIntegerB)");
		print("A(Int) &+ B(Int): \(oRandomIntegerA) &+ \(oRandomIntegerB) = \(oRandomIntegerA &+ oRandomIntegerB)");
		print("A(Int) &- B(Int): \(oRandomIntegerA) &- \(oRandomIntegerB) = \(oRandomIntegerA &- oRandomIntegerB)");
		print("A(Int) &* B(Int): \(oRandomIntegerA) &* \(oRandomIntegerB) = \(oRandomIntegerA &* oRandomIntegerB)");
		print("pow(A(Int),B(Int)): pow(\(oRandomIntegerA),\(oRandomIntegerB)) = \((pow(Decimal(oRandomIntegerA),oRandomIntegerB)))");
		print("A(Int) + B(Float): \(oRandomIntegerA) + \(oRandomFloat) = \((Float(oRandomIntegerA) + oRandomFloat))");
		print("A(Int) - B(Float): \(oRandomIntegerA) - \(oRandomFloat) = \((Float(oRandomIntegerA) - oRandomFloat))");
		print("A(Int) * B(Float): \(oRandomIntegerA) * \(oRandomFloat) = \((Float(oRandomIntegerA) * oRandomFloat))");
		print("A(Int) / B(Float): \(oRandomIntegerA) / \(oRandomFloat) = \((Float(oRandomIntegerA) / oRandomFloat))");
		print("A(Int) % B(Float): \(oRandomIntegerA) % \(oRandomFloat) = \((Float(oRandomIntegerA).truncatingRemainder(dividingBy: oRandomFloat)))");
		print("pow(A(Int),B(Float)): pow(\(oRandomIntegerA),\(oRandomFloat)) = \((pow(Decimal(oRandomIntegerA),Int(oRandomFloat))))");
		oRandomIntegerA += 1;
		print("A(Int) += 1: \(oRandomIntegerA)");
		oRandomIntegerA -= 1;
		print("A(Int) -= 1: \(oRandomIntegerA)");
		if (oRandomIntegerA > oRandomIntegerB) {
			print("IntegerA > IntegerB:",oRandomIntegerA,">",oRandomIntegerB);
		} else {
			print("IntegerB > IntegerA:",oRandomIntegerB,">",oRandomIntegerA);
		}
		
		let oRange1: Range = 0..<50;
		let oRange2: Range = 50..<101;
		if (oRange1.contains(oRandomIntegerA)) {
			print("IntegerA (\(oRandomIntegerA)) belong to Range1:",oRange1);
		}
		if (oRange2.contains(oRandomIntegerA)) {
			print("IntegerA (\(oRandomIntegerA)) belong to Range2:",oRange2);
		}
		if (oRange1.contains(oRandomIntegerB)) {
			print("IntegerB (\(oRandomIntegerB)) belong to Range1:",oRange1);
		}
		if (oRange2.contains(oRandomIntegerB)) {
			print("IntegerB (\(oRandomIntegerB)) belong to Range2:",oRange2);
		}
		
		let oOptionalA: Optional<Int> = nil;
		print("Optional A: \(String(describing: oOptionalA))");
		let oOptionalB: Optional<Int> = Int.random(in: 0...100);
		print("Optional B: \(String(describing: oOptionalB))");
		print("Not nil (A ?? B): \(String(describing: oOptionalB ?? oOptionalA))");
		
		var oArrayA: [Int] = [];
		var oArrayB: [Int] = [];
		for _ in 0...5 {
			oArrayA.append(Int.random(in: 0...10));
			oArrayB.append(Int.random(in: 0...10));
		}
		print("ArrayA:",oArrayA);
		print("ArrayB:",oArrayB);
		print("ArrayA + ArrayB:",oArrayA + oArrayB);
		
		for i in (0...10).reversed() {
			print("Reversed range iterations, index: \(i)");
		}
		
		var oValue: Int = 0;
		var oStorageArray: Array<Int> = [];
		while (oValue < 50) {
			oValue = Int.random(in: 0...100);
			print("While-loop value is: \(oValue)");
			oStorageArray.append(oValue);
		}
		print("Storage of values by While-loop:",oStorageArray);
		
		oValue = 0;
		oStorageArray = [];
		repeat {
			oValue = Int.random(in: 0...100);
			print("Repeat-loop value is: \(oValue)");
			oStorageArray.append(oValue);
		} while (oValue < 50)
		print("Storage of values by Repeat-loop:",oStorageArray);
		
		let oStringDictionary: String = MainHandler.mStringDictionary(inDictionaryTypes: [
			DictionaryTypes.AlphaLower
		]);
		for _ in 0...10 {
			switch MainHandler.mRandomString(inLength:1,inDictionary:oStringDictionary) {
				case "a": print("Letter \"A\"");
				case "x": print("Letter \"X\"");
				case "j": print("Letter \"J\""); fallthrough;
				case "m": print("Letter \"M\"");
				case "u": print("Letter \"U\"");
				case "f": print("Letter \"F\""); fallthrough;
				case "c": print("Letter \"C\"");
				case "d": print("Letter \"D\"");
				default: print("Unspecified letter")
			}
		}
		
		for _ in 0...10 {
			self.mGuardTest(inValue: Int.random(in: 0...100));
		}
		
		var oInoutValue1: MyInt = 1;
		let oInoutValue2: MyInt = 1;
		print("Inout Value1 before function:",oInoutValue1);
		print("Inout Value2 before function:",oInoutValue2);
		self.mInoutTest(inValue1: &oInoutValue1, inValue2: oInoutValue2);
		print("Inout Value1 after function:",oInoutValue1);
		print("Inout Value2 after function:",oInoutValue2);
    }
	
    func mGuardTest(inValue: MyInt) -> Void {
		
		guard inValue > 50 else {
    		print("Value less than 50");
    		return;
		}
		print("Guard test value:",inValue);
	}
	
	func mInoutTest(inValue1: inout MyInt,inValue2: MyInt) -> Void {
		
		inValue1 = inValue2 + inValue1;
	}
    
	@IBAction func mButtonExit(_ sender: Any) {
	
		exit(0);
	}
}

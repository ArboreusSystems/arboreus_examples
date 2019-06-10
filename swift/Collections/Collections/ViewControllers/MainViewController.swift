//
//  MainViewController.swift
//  Collections
//
//  Created by Alexandr Kirilov on 10/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
		
        super.viewDidLoad();
		
        let oNumber: UInt = 123456789;
        print("Number: ",oNumber);
        let oString: String = String(oNumber);
        print("String: ",oString);
		let oFirstChar = oString.first;
		print("String First Char: ",oFirstChar as Any);
		let oIndexFirstChar = oString.index(oString.startIndex,offsetBy: 0);
		print("String First Char by Index: ",oString[oIndexFirstChar]);
		
		for char in oString {
			print("Character: ",char);
		}
		
		let oArrayCharacters: [Character] = ["1","2","3","4","5","6","7","8","9"];
		print("ArrayCharacters: ",oArrayCharacters);
		let oStringFromArrayCharacters: String = String(oArrayCharacters);
		print("StringFromArrayCharacters: ",oStringFromArrayCharacters);
		let oArrayOfCharactersFromString: [Character] = Array(oStringFromArrayCharacters);
		print("ArrayOfCharactersFromString: ",oArrayOfCharactersFromString);
		
		for i in 0...(oArrayCharacters.count - 1) {
			print("Array of Characters Element[",i,"]: ",oArrayCharacters[i]);
		}
		
		var oArrayOfTuples: [(String,UInt,Float)] = [];
		let oCharactersDictionary: String = MainHandler.mStringDictionary(
			inDictionaryTypes: [DictionaryTypes.AlphaUpper,DictionaryTypes.Numeric]
		);
		var iID: String = ""; var iInt: UInt = 0; var iFloat: Float = 0.0;
		for _ in 0...10 {
			iID = MainHandler.mRandomString(inLength:32,inDictionary:oCharactersDictionary);
			iInt = UInt.random(in: 0..<100);
			iFloat = Float.random(in: 1..<100);
			oArrayOfTuples.append((iID,iInt,iFloat));
		}
		
		for iTuple in oArrayOfTuples {
			print("ID:",iTuple.0,", UInt:",iTuple.1,"Float:",iTuple.2)
		}
		
		var oDictionaryCoordinates: [String:(Float,Float)] = [:];
		let oDictionaryKeys: Array = ["Home","Work","Gym","Shop","Autostore"];
		for i in 0..<oDictionaryKeys.count {
			oDictionaryCoordinates[oDictionaryKeys[i]] = (
				Float.random(in: 0..<100),
				Float.random(in: 0..<100)
			);
		}
		print("Home: X ->",oDictionaryCoordinates["Home"]!.0,"Y ->",oDictionaryCoordinates["Home"]!.1);
		print("Shop: X ->",oDictionaryCoordinates["Shop"]!.0,"Y ->",oDictionaryCoordinates["Shop"]!.1);
		print("Work: X ->",oDictionaryCoordinates["Work"]!.0,"Y ->",oDictionaryCoordinates["Work"]!.1);
		print("Gym: X ->",oDictionaryCoordinates["Gym"]!.0,"Y ->",oDictionaryCoordinates["Gym"]!.1);
		print("Autostore: X ->",oDictionaryCoordinates["Autostore"]!.0,"Y ->",oDictionaryCoordinates["Autostore"]!.1);
    }
	
	@IBAction func mButtonExit(_ sender: Any) {
		
		exit(0);
	}
}

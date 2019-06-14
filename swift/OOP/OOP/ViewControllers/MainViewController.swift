//
//  MainViewController.swift
//  OOP
//
//  Created by Alexandr Kirilov on 13/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	var oFinal: Optional<Final> = Final();

	override func viewDidLoad() {

	    super.viewDidLoad();

	    print("Object oFinal.pTestString: \(oFinal!.pTestString!)");
	    oFinal!.pTestString = "pTestString value from code";
	    print("Object oFinal.pTestString: \(oFinal!.pTestString!)");

		if (oFinal?.mGetPrivateString() == nil) {
			print("Private string did not setup")
		}
		oFinal?.mSetPrivateString(inValue: "Private string new Value");
		print("Private string value: \(oFinal!.mGetPrivateString()!)");

		let oSingletonV1_1: SingletonV1 = SingletonV1.pInstance;
		print("oSingletonV1_1.pTestString:",oSingletonV1_1.pTestString);
		oSingletonV1_1.pTestString = "String from oSingletonV1_1";
		print("oSingletonV1_1.pTestString:",oSingletonV1_1.pTestString);
		let oSingletonV1_2: SingletonV1 = SingletonV1.pInstance;
		print("oSingletonV1_2.pTestString:",oSingletonV1_2.pTestString);
		oSingletonV1_2.pTestString = "String from oSingletonV1_2";
		print("oSingletonV1_1.pTestString:",oSingletonV1_1.pTestString);
		print("oSingletonV1_2.pTestString:",oSingletonV1_2.pTestString);

		let oSingletonV2_1: SingletonV2 = SingletonV2.mGetInstance;
		print("oSingletonV2_1.pTestString:",oSingletonV2_1.pTestString);
		oSingletonV2_1.pTestString = "String from oSingletonV2_1";
		print("oSingletonV2_1.pTestString:",oSingletonV2_1.pTestString);
		let oSingletonV2_2: SingletonV2 = SingletonV2.mGetInstance;
		print("oSingletonV2_2.pTestString:",oSingletonV2_2.pTestString);
		oSingletonV2_2.pTestString = "String from oSingletonV2_2";
		print("oSingletonV2_1.pTestString:",oSingletonV2_1.pTestString);
		print("oSingletonV2_2.pTestString:",oSingletonV2_2.pTestString);
		SingletonV2.mDeinit();
    }
	
	@IBAction func mButtonExit(_ sender: Any) {

		self.oFinal = nil;
		exit(0);
	}
}

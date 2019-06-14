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

	    print("oFinal: Object oFinal.pTestString - \(oFinal!.pTestString!)");
	    oFinal!.pTestString = "pTestString value from code";
	    print("oFinal: Object oFinal.pTestString - \(oFinal!.pTestString!)");

		if (oFinal?.mGetPrivateString() == nil) {
			print("oFinal: FinalPrivate string did not setup")
		}
		oFinal?.mSetPrivateString(inValue: "Private string new Value");
		print("oFinal: Private string value - \(oFinal!.mGetPrivateString()!)");

		let oFinal1: Final = Final().mInitWithString(inTestString:"String from code init");
		print("oFinal1: Initialised value - \(oFinal1.pTestString!)");

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

		let oAdapterV1Target: AdapterV1Target = AdapterV1Target();
		print("oAdapterV1Target.mTestString:",oAdapterV1Target.mGetPTestString());
		oAdapterV1Target.mSetPTestString(inString:"New String on Adapter Target");
		print("oAdapterV1Target.mTestString:",oAdapterV1Target.mGetPTestString());
		let oAdapterV1: AdapterV1 = AdapterV1();
		print("oAdapterV1.mGetPTestString:",oAdapterV1.mGetPTestString());
		oAdapterV1.mSetPTestString(inString:"New String on Adoptee");
		print("oAdapterV1.mGetPTestString:",oAdapterV1.mGetPTestString());
		print("oAdapterV1Adaptee.pTestString:",oAdapterV1.mGetPTestString());	
    }
	
	@IBAction func mButtonExit(_ sender: Any) {

		self.oFinal = nil;
		exit(0);
	}
}

//
//  MainViewController.swift
//  Optional
//
//  Created by Alexandr Kirilov on 11/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		var oReceipt: Receipt? = nil;
        for _ in 0...10 {
			oReceipt = MainHandler.mGetReceiptFromServerEmulation();
			if (oReceipt == nil) {
				print("Server Error");
			} else {
				print(oReceipt!);
			}
		}
    }
	
	@IBAction func mButtonExit(_ sender: Any) {
		
		exit(0);
	}
}

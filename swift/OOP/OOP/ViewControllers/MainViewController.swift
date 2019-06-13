//
//  MainViewController.swift
//  OOP
//
//  Created by Alexandr Kirilov on 13/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {

	    super.viewDidLoad();
	    print("Test");
    }
	
	@IBAction func mButtonExit(_ sender: Any) {

		exit(0);
	}
}

//
//  APRViewController.swift
//  Custom UI
//
//  Created by Alexandr Kirilov on 04/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class APRViewController: UIViewController {
	
	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = UIColor.white;
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .lightContent
	}
}

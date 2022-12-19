//
//  ARootNavigationController.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import UIKit

class ARootNavigationController: UINavigationController {


	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = __COLOR_GREEN_LIGHT;
		self.navigationBar.barStyle = .black;
	}
}

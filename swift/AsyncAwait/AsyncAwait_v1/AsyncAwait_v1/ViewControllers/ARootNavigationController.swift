//
//  ARootNavigationController.swift
//  AsyncAwait_v1
//
//  Created by Alexandr Kirilov on 20/12/2022.
//

import UIKit

class ARootNavigationController: UINavigationController {


	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = __COLOR_GREEN_LIGHT;
		self.navigationBar.barStyle = .black;
	}
}

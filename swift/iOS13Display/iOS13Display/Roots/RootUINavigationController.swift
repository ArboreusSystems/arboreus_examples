//
//  RootUINavigationController.swift
//  iOS13Display
//
//  Created by Alexandr Kirilov on 08/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

import UIKit

class RootUINavigationController: UINavigationController {

	override func loadView() {
		
		super.loadView();
		if #available(iOS 13.0, *) {
			self.view.overrideUserInterfaceStyle = .light;
		}
		if #available(iOS 11.0, *) {
			self.view.accessibilityIgnoresInvertColors = true;
			self.navigationController?.view.accessibilityIgnoresInvertColors = true;
		}
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
	}
}

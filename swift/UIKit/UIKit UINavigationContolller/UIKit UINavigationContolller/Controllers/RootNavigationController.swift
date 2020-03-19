//
//  RootNavigationController.swift
//  UIKit UINavigationContolller
//
//  Created by Alexandr Kirilov on 19/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		
		return .lightContent
	}
	
    override func viewDidLoad() {
		
		super.viewDidLoad();
		
		navigationBar.barTintColor = __COLOR_BLUE_DARK;
		navigationBar.tintColor = __COLOR_WHITE;
		navigationBar.titleTextAttributes = [.foregroundColor: __COLOR_WHITE];
		navigationBar.isTranslucent = false;
		
		setViewControllers([LoginViewController()], animated: true);
    }
}

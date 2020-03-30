//
//  RootNavigationController.swift
//  UIKit UISearchController
//
//  Created by Alexandr Kirilov on 30/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {
	
	let pNavBarBackgroundColor: UIColor = __COLOR_BLUE_DARK;
	let pNavBarTextColor: UIColor = __COLOR_WHITE;
	
	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .lightContent;
	}

    override func viewDidLoad() {
		
		super.viewDidLoad();
		
		navigationBar.barTintColor = pNavBarBackgroundColor;
		navigationBar.tintColor = pNavBarTextColor;
		navigationBar.titleTextAttributes = [.foregroundColor: pNavBarTextColor];
		navigationBar.isTranslucent = false;
//		navigationBar.barStyle = .black;
		
		if #available(iOS 11.0, *) {
			navigationBar.prefersLargeTitles = true;
			navigationItem.largeTitleDisplayMode = .always;
			view.backgroundColor = pNavBarBackgroundColor;
			navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: pNavBarTextColor];
		}
    }
}

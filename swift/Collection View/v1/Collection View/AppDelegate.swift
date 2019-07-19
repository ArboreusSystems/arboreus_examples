//
//  AppDelegate.swift
//  Collection View
//
//  Created by Alexandr Kirilov on 18/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var pWindow: Optional<UIWindow> = nil;

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
	
		let oStatusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView;
		if (oStatusBar.responds(to: #selector(setter: UIView.backgroundColor))) {
			oStatusBar.backgroundColor = _COLOR_BLACK;
		}
		
		self.pWindow = UIWindow(frame: UIScreen.main.bounds);
		self.pWindow!.rootViewController = VCNavigation(
			rootViewController: VCCollection(collectionViewLayout: UICollectionViewFlowLayout())
		);
		self.pWindow!.makeKeyAndVisible();
		
		return true;
	}
}


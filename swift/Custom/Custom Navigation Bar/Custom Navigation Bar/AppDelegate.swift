//
//  AppDelegate.swift
//  Custom Navigation Bar
//
//  Created by Alexandr Kirilov on 15/07/2019.
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
		
		pWindow = UIWindow(frame: UIScreen.main.bounds);
		self.pWindow!.rootViewController = VCRoot();
		self.pWindow!.makeKeyAndVisible();
		
		return true;
	}
}

extension AppDelegate {
	
	static var shared: AppDelegate {
		return UIApplication.shared.delegate as! AppDelegate;
	}
	
	var rootViewController: VCRoot {
		return pWindow!.rootViewController as! VCRoot;
	}
}

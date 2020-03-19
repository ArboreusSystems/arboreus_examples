//
//  AppDelegate.swift
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 13/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var pWindow: Optional<UIWindow> = nil;

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		pWindow = UIWindow(frame: UIScreen.main.bounds);
		self.pWindow?.rootViewController = VCMain();
		self.pWindow?.makeKeyAndVisible();
		
		return true;
	}
}


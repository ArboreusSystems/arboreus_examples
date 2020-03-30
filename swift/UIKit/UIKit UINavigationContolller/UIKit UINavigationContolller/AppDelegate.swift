//
//  AppDelegate.swift
//  UIKit UINavigationContolller
//
//  Created by Alexandr Kirilov on 19/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: Optional<UIWindow> = nil;

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
			
		if #available (iOS 13.0, *) {} else {
			window = UIWindow(frame: UIScreen.main.bounds);
			let oLoginViewController: LoginViewController = LoginViewController();
			self.window?.rootViewController = oLoginViewController;
			self.window?.makeKeyAndVisible();
		}
		
		return true;
	}

	// MARK: UISceneSession Lifecycle

	@available(iOS 13, *)
	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	@available(iOS 13, *)
	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}


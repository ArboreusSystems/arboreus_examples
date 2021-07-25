//
//  AppDelegate.swift
//  HomeIndicatorHide_v2
//
//  Created by Alexandr Kirilov on 25.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: Optional<UIWindow> = nil;
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		if #available(iOS 13.0, *) {} else {
			self.window = UIWindow(frame: UIScreen.main.bounds);
			let oRootController = RootViewController(rootViewController: MainViewcontroller());
			window?.rootViewController = oRootController;
			window?.makeKeyAndVisible();
		}
		
		return true;
	}

	// MARK: UISceneSession Lifecycle

	@available(iOS 13.0, *)
	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	@available(iOS 13.0, *)
	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		
	}
}


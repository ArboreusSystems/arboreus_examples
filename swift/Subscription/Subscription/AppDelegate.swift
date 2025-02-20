//
//  AppDelegate.swift
//  Subscription
//
//  Created by Alexandr Kirilov on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds);
		self.window?.rootViewController = SubscriptionViewController() as UIViewController;
		self.window?.makeKeyAndVisible();
		
		return true
	}
}


//
//  AppDelegate.swift
//  FacebookLogin
//
//  Created by Alexandr Kirilov on 10/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

import UIKit
import FacebookCore

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


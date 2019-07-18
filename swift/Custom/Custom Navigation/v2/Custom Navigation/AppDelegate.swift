//
//  AppDelegate.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 18/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

let pVCRoot: VCRoot = AppDelegate.shared.rootViewController;

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var pWindow: Optional<UIWindow> = nil;

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		pWindow = UIWindow(frame: UIScreen.main.bounds);
		pWindow?.rootViewController = VCRoot();
		pWindow?.makeKeyAndVisible();
		
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

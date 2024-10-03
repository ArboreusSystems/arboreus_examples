//
//  AppDelegate.swift
//  UsingCPPInterop_v2
//
//  Created by Alexandr Kirilov on 03/10/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	let pCPPNumber = gGetNumber(100)
	let pCPPString: String = String(gGetCPPString())

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		print("Number: ",pCPPNumber);
		print("String: ",pCPPString);
		
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
	
	}
}


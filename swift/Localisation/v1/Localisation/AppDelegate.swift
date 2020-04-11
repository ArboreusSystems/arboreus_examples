//
//  AppDelegate.swift
//  Localisation
//
//  Created by Alexandr Kirilov on 28/02/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: Optional<UIWindow> = nil;

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		if #available (iOS 13.0, *) {} else {
			window = UIWindow(frame: UIScreen.main.bounds);
			self.window?.rootViewController = MainViewController() as UIViewController;
			self.window?.makeKeyAndVisible();
		}
		
		print("Languages:",Locale.preferredLanguages);
		
		if (UIDevice.current.userInterfaceIdiom == .pad) {
			print("Device type: pad");
		}
		
		if (UIDevice.current.userInterfaceIdiom == .phone) {
			print("Device type: phone");
		}
		
		if (UIDevice.current.userInterfaceIdiom == .unspecified) {
			print("Device type: unspecified");
		}
		
		print("Locale.autoupdatingCurrent:",Locale.autoupdatingCurrent);
		print("Locale.current:",Locale.current);
		
		print("Locale.availableIdentifiers:",Locale.availableIdentifiers);
		print("Locale.isoRegionCodes:",Locale.isoRegionCodes);
		print("Locale.isoLanguageCodes:",Locale.isoLanguageCodes);
		print("Locale.isoCurrencyCodes:",Locale.isoCurrencyCodes);
		print("Locale.commonISOCurrencyCodes:",Locale.commonISOCurrencyCodes);
		
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


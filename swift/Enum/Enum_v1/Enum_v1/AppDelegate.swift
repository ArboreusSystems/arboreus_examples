//
//  AppDelegate.swift
//  Enum_v1
//
//  Created by Alexandr Kirilov on 21.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let oEnum: AEnum = AEnum.pInstance;
        oEnum.mTestSimple();
        oEnum.mTestAssociative();
        oEnum.mTestRaw();
        oEnum.mTestTrick1();
		oEnum.mTestTrick2();
		oEnum.mTestTrick3();
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}


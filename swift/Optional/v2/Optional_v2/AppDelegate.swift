//
//  AppDelegate.swift
//  Optional_v2
//
//  Created by Alexandr Kirilov on 15.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        var oDictionaryWithNils1: [String: Int?] = [
            "one": 1,
            "two": 2,
            "three": 3
        ];
        print("oDictionaryWithNils1 Step 1: ",oDictionaryWithNils1.count);
        
        oDictionaryWithNils1["three"] = nil;
        print("oDictionaryWithNils1 Step 2: ",oDictionaryWithNils1.count);
        
        oDictionaryWithNils1["two"] = nil;
        print("oDictionaryWithNils1 Step 3: ",oDictionaryWithNils1.count);
        
        oDictionaryWithNils1["one"] = nil;
        print("oDictionaryWithNils1 Step 4: ",oDictionaryWithNils1.count);
        
        var oDictionaryWithNils2: [String: Int?] = [
            "one": 1,
            "two": 2,
            "three": nil
        ];
        print("oDictionaryWithNils2 Step 1: ",oDictionaryWithNils2.count);
        
        oDictionaryWithNils2["two"] = nil;
        oDictionaryWithNils2["three"] = nil;
        print("oDictionaryWithNils2 Step 2: ",oDictionaryWithNils2.count);
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}


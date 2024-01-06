//
//  AppDelegate.swift
//  UsingRust_v1
//
//  Created by Alexandr Kirilov on 06/01/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var pWindow: Optional<UIWindow> = nil;
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        __ALog("willFinishLaunchingWithOptions");
        
        return true;
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        pWindow = UIWindow(frame: UIScreen.main.bounds);
        self.pWindow?.rootViewController = ARootNavigationController(rootViewController: AMainViewController()) as UIViewController;
        self.pWindow?.makeKeyAndVisible();
        
        __ALog("didFinishLaunchingWithOptions");
        
        return true;
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
            
        __ALog("applicationDidBecomeActive");
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
        __ALog("applicationWillResignActive");
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        __ALog("open url");
        
        return true;
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        
        __ALog("applicationDidReceiveMemoryWarning");
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
        __ALog("applicationWillTerminate");
    }
    
    func applicationSignificantTimeChange(_ application: UIApplication) {
        
        __ALog("applicationSignificantTimeChange");
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        __ALog("didRegisterForRemoteNotificationsWithDeviceToken");
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        __ALog("didFailToRegisterForRemoteNotificationsWithError");
    }
    
    func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        
        __ALog("didUpdate userActivity");
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        __ALog("applicationDidEnterBackground");
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
        __ALog("applicationWillEnterForeground");
    }
}

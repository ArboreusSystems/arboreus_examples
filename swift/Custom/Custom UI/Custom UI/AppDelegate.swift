//
//  AppDelegate.swift
//  Custom UI
//
//  Created by Alexandr Kirilov on 03/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		window = UIWindow(frame: UIScreen.main.bounds);
		self.window?.rootViewController = MainViewController() as UIViewController;
		self.window?.makeKeyAndVisible();
		
		print("UIScreen.main.scale: ",UIScreen.main.scale);
		print("UIScreen.main.nativeBounds: width -> ",UIScreen.main.nativeBounds.width);
		print("UIScreen.main.nativeBounds: height -> ",UIScreen.main.nativeBounds.height);
		print("UIScreen.main.bounds: width -> ",UIScreen.main.bounds.width);
		print("UIScreen.main.bounds: height -> ",UIScreen.main.bounds.height);
		
		print("self.window?.safeAreaInsets.top -> ",self.window?.safeAreaInsets.top ?? 222);
		print("self.window?.safeAreaInsets.bottom -> ",self.window?.safeAreaInsets.bottom ?? 222);
		print("self.window?.safeAreaInsets.left -> ",self.window?.safeAreaInsets.left ?? 222);
		print("self.window?.safeAreaInsets.right -> ",self.window?.safeAreaInsets.right ?? 222);
		
		return true;
	}
}

extension UIApplication {

var statusBarUIView: UIView? {
	
    if #available(iOS 13.0, *) {
        let oTag = 150877;
        let oKeyWindow = UIApplication.shared.connectedScenes
        	.filter({$0.activationState == .foregroundActive})
        	.map({$0 as? UIWindowScene})
        	.compactMap({$0})
        	.first?.windows
        	.filter({$0.isKeyWindow}).first;

        if let oStatusBar = oKeyWindow?.viewWithTag(oTag) {
        	oStatusBar.backgroundColor = _COLOR_PURPLE;
            return oStatusBar;
        } else {
            guard let oStatusBarFrame = oKeyWindow?.windowScene?.statusBarManager?.statusBarFrame else { return nil }
            let oStatusBar = UIView(frame: oStatusBarFrame);
            oStatusBar.backgroundColor = _COLOR_PURPLE;
            oStatusBar.tag = oTag;
            oKeyWindow?.addSubview(oStatusBar);
            return oStatusBar;
        }
    } else if responds(to: Selector(("statusBar"))) {
		let oStatusBar: UIView = (value(forKey: "statusBar") as? UIView)!;
		oStatusBar.backgroundColor = _COLOR_PURPLE;
        return oStatusBar;
    } else {
        return nil
    }
  }
}

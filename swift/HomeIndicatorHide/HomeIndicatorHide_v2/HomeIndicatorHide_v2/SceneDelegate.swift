//
//  SceneDelegate.swift
//  HomeIndicatorHide_v2
//
//  Created by Alexandr Kirilov on 25.07.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: Optional<UIWindow> = nil;

	@available(iOS 13.0, *) func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let oWindowScene = (scene as? UIWindowScene) else { return }
		
		self.window = UIWindow(windowScene: oWindowScene);
		let oRootViewController = RootViewController(rootViewController: MainViewcontroller());
		window?.rootViewController = oRootViewController;
		window?.makeKeyAndVisible();
	}

	@available(iOS 13.0, *) func sceneDidDisconnect(_ scene: UIScene) {}
	@available(iOS 13.0, *) func sceneDidBecomeActive(_ scene: UIScene) {}
	@available(iOS 13.0, *) func sceneWillResignActive(_ scene: UIScene) {}
	@available(iOS 13.0, *) func sceneWillEnterForeground(_ scene: UIScene) {}
	@available(iOS 13.0, *) func sceneDidEnterBackground(_ scene: UIScene) {}
}


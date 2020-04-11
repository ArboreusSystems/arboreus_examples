//
//  SceneDelegate.swift
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 31/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

@available(iOS 13, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: Optional<UIWindow> = nil;

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = scene as? UIWindowScene else {
			fatalError();
		}
		
		window = UIWindow(windowScene: windowScene);
		window?.rootViewController = MainViewController() as UIViewController;
		window?.makeKeyAndVisible();
	}

	func sceneDidDisconnect(_ scene: UIScene) {}
	func sceneDidBecomeActive(_ scene: UIScene) {}
	func sceneWillResignActive(_ scene: UIScene) {}
	func sceneWillEnterForeground(_ scene: UIScene) {}
	func sceneDidEnterBackground(_ scene: UIScene) {}
}

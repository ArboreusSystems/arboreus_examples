//
//  ApplicationHandler.swift
//  UIKit UINavigationContolller
//
//  Created by Alexandr Kirilov on 19/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class ApplicationHandler: NSObject {

	static func mDoExit() -> Void {

		let oAlertController: UIAlertController = UIAlertController(
			title: "Exit",
			message: "Application is about exit. Are you sure?",
			preferredStyle: .alert
		);
		oAlertController.addAction(UIAlertAction.init(
			title: "Exit", style: .default, handler: {_ in
			print("Application is about to exit");
			exit(0);
		}));
		oAlertController.addAction(UIAlertAction.init(
			title: "Cancel", style: .cancel, handler: {_ in
			print("Application exit canceled")
		}));
		UIApplication.shared.keyWindow?.rootViewController?.present(
			oAlertController, animated: true
		);
	}
}

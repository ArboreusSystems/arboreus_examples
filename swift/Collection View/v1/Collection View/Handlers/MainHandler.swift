//
//  MainHandler.swift
//  Collection View
//
//  Created by Alexandr Kirilov on 19/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class MainHandler: NSObject {

	static func mDoExit() {

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

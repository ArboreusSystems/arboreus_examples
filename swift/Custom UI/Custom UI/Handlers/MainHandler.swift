//
//  MainHandler.swift
//  Custom UI
//
//  Created by Alexandr Kirilov on 2019-07-03.
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

	static func mRandomColor() -> UIColor {

		return UIColor(
			red: CGFloat.random(in: 0...255) / 255.0,
			green: CGFloat.random(in: 1...255) / 255.0,
			blue: CGFloat.random(in: 1...255) / 255.0,
			alpha: 1
		);
	}
}

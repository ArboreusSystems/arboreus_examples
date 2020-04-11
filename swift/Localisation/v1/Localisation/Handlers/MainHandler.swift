//
//  MainHandler.swift
//  Localisation
//
//  Created by Alexandr Kirilov on 28/02/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
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
		
		var oWindow: Optional<UIWindow> = nil;
		if #available(iOS 13, *) {
			oWindow = UIApplication.shared.windows.first{$0.isKeyWindow};
        } else {
			oWindow = UIApplication.shared.keyWindow;
        }
		oWindow?.rootViewController?.present(oAlertController, animated: true);
	}
}

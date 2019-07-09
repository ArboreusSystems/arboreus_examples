//
//  AlertHandler.swift
//  Errors
//
//  Created by Alexandr Kirilov on 09/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class AlertHandler: NSObject {

	static func mCreate(inMessage: String) -> Void {
		
		let oAlertController: UIAlertController = UIAlertController(
			title: "Alert", message: inMessage, preferredStyle: .alert
		);
		oAlertController.addAction(UIAlertAction(
			title: "OK", style: .default, handler: nil
		));
		UIApplication.shared.keyWindow?.rootViewController?.present(
			oAlertController, animated: true
		);
	}
}

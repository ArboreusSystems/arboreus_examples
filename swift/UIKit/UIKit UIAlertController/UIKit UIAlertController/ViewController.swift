//
//  ViewController.swift
//  UIKit UIAlertController
//
//  Created by Alexandr Kirilov on 23/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		
		super.viewDidLoad();
	}
	
	@IBAction func mButtonActionSheet(_ sender: Any) {
		
		print("Button test TestActionSheet");
		
		let oAlert: UIAlertController = UIAlertController(title: "Test Alert", message: "Test alert message", preferredStyle: .actionSheet);
		let oActionOK: UIAlertAction = UIAlertAction(
			title: "OK", style: .default, handler: { _ in print("OK Pressed")}
		);
		let oActionCancel: UIAlertAction = UIAlertAction(
			title: "Cancel", style: .cancel, handler: {_ in print("Cancel Pressed")}
		);
		oAlert.addAction(oActionOK);
		oAlert.addAction(oActionCancel);
		UIApplication.shared.keyWindow?.rootViewController?.present(
			oAlert, animated: true
		);
	}
	
	@IBAction func mButtonAlert(_ sender: Any) {
	
		print("Button test Alert");
		
		let oAlert: UIAlertController = UIAlertController(title: "Test Alert", message: "Test alert message", preferredStyle: .alert);
		let oActionOK: UIAlertAction = UIAlertAction(
			title: "OK", style: .default, handler: { _ in print("OK Pressed")}
		);
		let oActionCancel: UIAlertAction = UIAlertAction(
			title: "Cancel", style: .cancel, handler: {_ in print("Cancel Pressed")}
		);
		oAlert.addAction(oActionOK);
		oAlert.addAction(oActionCancel);
		UIApplication.shared.keyWindow?.rootViewController?.present(
			oAlert, animated: true
		);
	}
}


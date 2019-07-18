//
//  VCMain.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 18/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCMain: UIViewController {

	override func loadView() -> Void {
		
		super.loadView();
		self.view.backgroundColor = _COLOR_WHITE;
		self.title = "Main";
	}
	
	override func viewDidLoad() -> Void {
		
		super.loadView();
		
		let oLeaveButton: UIBarButtonItem = UIBarButtonItem(
			title: "Leave", style: .plain, target: self, action: #selector(mDoLeave)
		);
		navigationItem.setLeftBarButton(oLeaveButton, animated: true);
	}
	
	@objc private func mDoLeave() -> Void {
		
		UserDefaults.standard.set(false, forKey: _PROPERTY_AUTHORISED);
		AppDelegate.shared.rootViewController.mShowAuthFromApp();
	}
}

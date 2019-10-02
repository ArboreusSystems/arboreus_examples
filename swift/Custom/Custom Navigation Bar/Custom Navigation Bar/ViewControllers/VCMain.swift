//
//  VCMain.swift
//  Custom Navigation Bar
//
//  Created by Alexandr Kirilov on 15/07/2019.
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
		
		print("kjllkjh");
	}
}


//class VCMain: UIViewController {
//
//	override func loadView() {
//
//		super.loadView();
//		self.view.backgroundColor = _COLOR_WHITE;
//	}
//
//	override func viewDidLoad() {
//
//		super.viewDidLoad();
//
//		let oTestButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34));
//		oTestButton.setTitle("ok", for: .normal);
//		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: oTestButton);
//	}
//}

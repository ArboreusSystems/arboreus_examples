//
//  VCMain.swift
//  UIKit UISwitch
//
//  Created by Alexandr Kirilov on 23/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCMain: UIViewController {

	var pCurrent: UIViewController = VCSwitch();
	
	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = _COLOR_PURPLE
		self.view.addSubview(pCurrent.view);
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .lightContent;
	}
	
	override func viewDidLayoutSubviews() {
		
		let oSafeArea: UILayoutGuide = self.view.safeAreaLayoutGuide;
		pCurrent.view.topAnchor.constraint(equalTo: oSafeArea.topAnchor).isActive = true;
		pCurrent.view.bottomAnchor.constraint(equalTo: oSafeArea.bottomAnchor).isActive = true;
		pCurrent.view.leftAnchor.constraint(equalTo: oSafeArea.leftAnchor).isActive = true;
		pCurrent.view.rightAnchor.constraint(equalTo: oSafeArea.rightAnchor).isActive = true;
	}
}

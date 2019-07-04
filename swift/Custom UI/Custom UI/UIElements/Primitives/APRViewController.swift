//
//  APRViewController.swift
//  Custom UI
//
//  Created by Alexandr Kirilov on 04/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class APRViewController: UIViewController {

	let pView: UIView = UIView();
	
	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .lightContent
	}

	override func loadView() {

		super.loadView();
		self.view.backgroundColor = _COLOR_PURPLE;
		let oSafeArea: UILayoutGuide = self.view.safeAreaLayoutGuide;
		pView.translatesAutoresizingMaskIntoConstraints = false;
		pView.backgroundColor = _COLOR_WHITE;
		self.view.addSubview(pView);
		pView.leftAnchor.constraint(equalTo: oSafeArea.leftAnchor).isActive = true;
		pView.rightAnchor.constraint(equalTo: oSafeArea.rightAnchor).isActive = true;
		pView.bottomAnchor.constraint(equalTo: oSafeArea.bottomAnchor).isActive = true;
		pView.topAnchor.constraint(equalTo: oSafeArea.topAnchor).isActive = true;
	}
}

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
	var pScreenWidth: CGFloat = 0;
	var pScreenHeight: CGFloat = 0;
	var pElementX: CGFloat = 0;
	var pElementWidth: CGFloat = 0;
	
	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .lightContent
	}
	
	override func viewDidLayoutSubviews() {
		
		super.viewDidLayoutSubviews();
		
		pScreenWidth = pView.frame.size.width;
		pScreenHeight = pView.frame.size.height;
		pElementX = (pScreenWidth - (pScreenWidth * 0.8)) / 2;
		pElementWidth = pScreenWidth * 0.8;
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

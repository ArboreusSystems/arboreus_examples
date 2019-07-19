//
//  VCSplash.swift
//  Custom Navigation Bar
//
//  Created by Alexandr Kirilov on 19/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCSplash: UIViewController {

	var pView: UIViewController = {
	
		let oViewController: UIViewController = UIViewController();
		oViewController.view.backgroundColor = _COLOR_WHITE;
		oViewController.view.translatesAutoresizingMaskIntoConstraints = false;
		return oViewController;
	}();
	
	var pIndicator: ELIndicatorLoad = {
		
		let oIndicator: ELIndicatorLoad = ELIndicatorLoad(
			frame: CGRect(x: 0, y: 0, width: 50, height: 50),
			image: UIImage(named: "IndicatorLoad")!
		);
		oIndicator.translatesAutoresizingMaskIntoConstraints = false;
		return oIndicator;
	}();

	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .lightContent;
	}

	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = _COLOR_BLACK;
		
		let oSafeArea: UILayoutGuide = self.view.safeAreaLayoutGuide;
		
		self.view.addSubview(pView.view);
		pView.view.topAnchor.constraint(equalTo: oSafeArea.topAnchor).isActive = true;
		pView.view.bottomAnchor.constraint(equalTo: oSafeArea.bottomAnchor).isActive = true;
		pView.view.leftAnchor.constraint(equalTo: oSafeArea.leftAnchor).isActive = true;
		pView.view.rightAnchor.constraint(equalTo: oSafeArea.rightAnchor).isActive = true;
		
		self.view.addSubview(pIndicator);
		pIndicator.centerXAnchor.constraint(equalTo: pView.view.centerXAnchor).isActive = true;
		pIndicator.centerYAnchor.constraint(equalTo: pView.view.centerYAnchor).isActive = true;
		pIndicator.mStartAnimating();
	}
}

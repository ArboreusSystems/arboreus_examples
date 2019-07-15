//
//  ARBViewController.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 2019-07-14.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class ARBViewController: UIViewController {

	let pView: UIView = UIView();
	var pScreenWidth: CGFloat = 0;
	var pScreenHeight: CGFloat = 0;

	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .lightContent
	}

	override func loadView() {

		super.loadView();

		let oSafeArea: UILayoutGuide = self.view.safeAreaLayoutGuide;
		pView.translatesAutoresizingMaskIntoConstraints = false;
		pView.backgroundColor = _COLOR_WHITE;
		self.view.addSubview(pView);

		pView.leftAnchor.constraint(equalTo: oSafeArea.leftAnchor).isActive = true;
		pView.rightAnchor.constraint(equalTo: oSafeArea.rightAnchor).isActive = true;
		pView.bottomAnchor.constraint(equalTo: oSafeArea.bottomAnchor).isActive = true;
		pView.topAnchor.constraint(equalTo: oSafeArea.topAnchor).isActive = true;
	}

	override func viewDidLayoutSubviews() {

		super.viewDidLayoutSubviews();
		pScreenWidth = pView.frame.size.width;
		pScreenHeight = pView.frame.size.height;
	}
}

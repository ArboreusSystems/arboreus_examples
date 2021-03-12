//
//  VCMainWrapper.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 2019-07-15.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCMainWrapper: UIViewController {

	private let pMainView: VCMain = VCMain();

	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .lightContent
	}

	override func loadView() {

		super.loadView();

		self.view.backgroundColor = _COLOR_GREEN_DARK;

		let oSafeArea: UILayoutGuide = self.view.safeAreaLayoutGuide;
		self.view.addSubview(pMainView.view);
		pMainView.view.leftAnchor.constraint(equalTo: oSafeArea.leftAnchor).isActive = true;
		pMainView.view.rightAnchor.constraint(equalTo: oSafeArea.rightAnchor).isActive = true;
		pMainView.view.bottomAnchor.constraint(equalTo: oSafeArea.bottomAnchor).isActive = true;
		pMainView.view.topAnchor.constraint(equalTo: oSafeArea.topAnchor).isActive = true;
	}

	override func viewDidLayoutSubviews() {

		super.viewDidLayoutSubviews();
		pMainView.pScreenWidth = self.view.frame.size.width;
		pMainView.pScreenHeight = self.view.frame.size.height;
	}
}

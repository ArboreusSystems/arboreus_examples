//
//  MainViewController.swift
//  UIKit UIStackView
//
//  Created by Alexandr Kirilov on 10/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	var pStackView: UIStackView = UIStackView();

    override func viewDidLoad() {
		
		super.viewDidLoad();
		view.backgroundColor = __COLOR_BLUE_LIGHT;
		
		mSetupStackView();
		mSetupStackViewElements();
	}
	
	private func mSetupStackView() -> Void {
		
		pStackView.axis = .vertical;
		pStackView.distribution = .fillEqually;
		pStackView.spacing = 20;
		
		view.addSubview(pStackView);
		
		pStackView.backgroundColor = __COLOR_BLUE_DARK;
		pStackView.translatesAutoresizingMaskIntoConstraints = false;
		pStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true;
		pStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true;
		pStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true;
		pStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true;
	}
	
	private func mSetupStackViewElements() -> Void {
		
		let oNumberOfElements: Int = 5;
		for i in 1...oNumberOfElements {
			let iButton: UIButton = UIButton();
			iButton.backgroundColor = __COLOR_BLUE_DARK;
			iButton.setTitle("Button \(i)", for: .normal);
			iButton.tintColor = __COLOR_WHITE;
			pStackView.addArrangedSubview(iButton);
		}
	}
}

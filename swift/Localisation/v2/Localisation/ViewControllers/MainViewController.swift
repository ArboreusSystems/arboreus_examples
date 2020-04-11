//
//  MainViewController.swift
//  Localisation
//
//  Created by Alexandr Kirilov on 10/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	private let pLabelDemoText: UILabel = UILabel();
	private let pPadding: CGFloat = 20.0;
	
	override func loadView() {
		
		super.loadView();
		view.backgroundColor = __COLOR_BLUE_LIGHT;
	}
	
    override func viewDidLoad() {
		
		super.viewDidLoad();
		
		mSetupLabelDemoText();
		
		view.addSubview(pLabelDemoText);
		pLabelDemoText.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true;
		pLabelDemoText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true;
		pLabelDemoText.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: pPadding).isActive = true;
		pLabelDemoText.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -pPadding).isActive = true;
		pLabelDemoText.heightAnchor.constraint(equalToConstant: 65.0).isActive = true;
	}
	
	// MARK: UI Elements
	
	private func mSetupLabelDemoText() -> Void {
		
		pLabelDemoText.backgroundColor = __COLOR_WHITE;
		pLabelDemoText.translatesAutoresizingMaskIntoConstraints = false;
		pLabelDemoText.textAlignment = .center;
		pLabelDemoText.text = NSLocalizedString("pLabelDemoText.text", comment: "Demo Label text");
	}
}

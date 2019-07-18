//
//  VCAuth.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 18/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCAuth: UIViewController {

	override func loadView() {
	
		super.loadView();
		self.view.backgroundColor = _COLOR_WHITE;
		self.title = "User authorisation";
	}

    override func viewDidLoad() {
		
        super.viewDidLoad();
		
        let oAuthoriseButton: UIBarButtonItem = UIBarButtonItem(
			title: "Authorise", style: .plain, target: self, action: #selector(mDoAuthorise)
        );
        navigationItem.setLeftBarButton(oAuthoriseButton, animated: true);
    }
	
    @objc private func mDoAuthorise() -> Void {
		
		UserDefaults.standard.set(true, forKey: _PROPERTY_AUTHORISED);
		AppDelegate.shared.rootViewController.mShowMain();
	}
}

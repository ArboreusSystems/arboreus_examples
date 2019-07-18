//
//  VCSplash.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 18/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCSplash: UIViewController {

	private let pActivityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge);
	
	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = _COLOR_WHITE;
		self.title = "Splashscreen";
		
		self.pActivityIndicator.frame = view.bounds;
		self.pActivityIndicator.backgroundColor = _COLOR_GREEN;
	}

    override func viewDidLoad() {
		
        super.viewDidLoad();
		
        view.addSubview(pActivityIndicator);
        self.mApplicationLoad();
    }
	
    private func mApplicationLoad() -> Void {
		
		self.pActivityIndicator.startAnimating();
		DispatchQueue.main.asyncAfter(
			deadline: DispatchTime.now() + .seconds(3),
			execute: {
				self.pActivityIndicator.stopAnimating()
				if (UserDefaults.standard.bool(forKey: _PROPERTY_AUTHORISED)) {
					print("User Authorised");
					AppDelegate.shared.rootViewController.mShowMain();
				} else {
					print("User not Authorised");
					AppDelegate.shared.rootViewController.mShowAuth();
				}
		});
	}
}

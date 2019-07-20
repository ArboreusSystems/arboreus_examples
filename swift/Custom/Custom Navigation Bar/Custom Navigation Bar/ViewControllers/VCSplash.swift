//
//  VCSplash.swift
//  Custom Navigation Bar
//
//  Created by Alexandr Kirilov on 19/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCSplash: UIViewController {
	
	var pIndicator: ELIndicatorLoad = ELIndicatorLoad(
			frame: CGRect(x: 0, y: 0, width:50, height: 50)
	);

	var pLabel: UILabel = {
		
		let oLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30));
		oLabel.translatesAutoresizingMaskIntoConstraints = false;
		oLabel.text = "Application Loading";
		oLabel.textAlignment = NSTextAlignment.center;
		return oLabel;
	}();

	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = _COLOR_WHITE;
		
		self.view.addSubview(pIndicator);
		pIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50).isActive = true;
		pIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
		pIndicator.widthAnchor.constraint(equalToConstant: 50).isActive = true;
		pIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true;
		
		self.view.addSubview(pLabel);
		pLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 10).isActive = true;
		pLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
		pLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true;
		pLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true;
		
		pIndicator.mStartAnimating();
		
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5), execute: {
			self.pIndicator.mStopAnimating();
			AppDelegate.shared.rootViewController.mShowMain();
		});
	}
}

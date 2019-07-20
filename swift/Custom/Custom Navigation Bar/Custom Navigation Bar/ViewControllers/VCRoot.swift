//
//  VCRoot.swift
//  Custom Navigation Bar
//
//  Created by Alexandr Kirilov on 18/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCRoot: UINavigationController {

	private var pCurrent: UIViewController;
	
	init() {
	
		self.pCurrent = VCSplash();
		super.init(nibName: nil, bundle: nil);
	}
	
	required init?(coder aDecoder: NSCoder) {
	
		self.pCurrent = VCSplash();
		super.init(coder: aDecoder);
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .lightContent;
	}
	
	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = _COLOR_BLACK;
		self.mSetNavigationBar();
		if (self.isNavigationBarHidden == false) {
			self.setNavigationBarHidden(true, animated: false);
		}
		self.addChild(pCurrent);
		self.view.addSubview(pCurrent.view);
		self.mSetCurrentConstraints();
		pCurrent.didMove(toParent: self);
	}
	
    func mShowMain() -> Void {
		
		if (self.isNavigationBarHidden == true) {
			self.setNavigationBarHidden(false, animated: true);
		}
    	let oMain: VCMain = VCMain();
    	oMain.view.frame = self.view.bounds;
    	self.view.addSubview(oMain.view);
    	oMain.didMove(toParent: self);
    	pCurrent.willMove(toParent: nil);
    	pCurrent.view.removeFromSuperview();
    	pCurrent.removeFromParent();
    	pCurrent = oMain;
		self.mSetCurrentConstraints();
	}
	
	private func mSetNavigationBar() -> Void {
	
		self.navigationBar.isTranslucent = false;
		self.navigationBar.barTintColor = _COLOR_BLUE;
	}
	
	private func mSetCurrentConstraints() -> Void {
	
		pCurrent.view.translatesAutoresizingMaskIntoConstraints = false;
		let oSafeArea: UILayoutGuide = self.view.safeAreaLayoutGuide;
		pCurrent.view.topAnchor.constraint(equalTo: oSafeArea.topAnchor).isActive = true;
		pCurrent.view.bottomAnchor.constraint(equalTo: oSafeArea.bottomAnchor).isActive = true;
		pCurrent.view.leftAnchor.constraint(equalTo: oSafeArea.leftAnchor).isActive = true;
		pCurrent.view.rightAnchor.constraint(equalTo: oSafeArea.rightAnchor).isActive = true;
	}
}

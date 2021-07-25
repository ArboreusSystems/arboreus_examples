//
//  MainViewController.swift
//  HomeIndicatorHide_v2
//
//  Created by Alexandr Kirilov on 25.07.2021.
//

import UIKit

class MainViewcontroller: UIViewController {
	
	var pHideHomeIndicator: Bool = false;
	let pButton: UIButton = UIButton();
	
	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = __COLOR_BLUE_DARK;
		
		pButton.addTarget(self, action: #selector(mActionButton), for: .touchUpInside);
		pButton.frame = CGRect(x: 0,y: 0,width: 250,height: 60);
		pButton.mSetBackgroundColor(inColor: __COLOR_PURPLE, inState: .normal);
		pButton.mSetBackgroundColor(inColor: __COLOR_WHITE, inState: .highlighted);
		pButton.setTitleColor(__COLOR_BLUE_DARK, for: .highlighted);
		pButton.center = self.view.center;
		self.mSetButtonTitle();
		self.view.addSubview(pButton);
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
		self.title = "Hide HomeBar Programmatically";
	}
	
	@objc func mActionButton() {
		
		if (pHideHomeIndicator) {
			pHideHomeIndicator = false;
		} else {
			pHideHomeIndicator = true;
		}
		if #available(iOS 11.0, *) {
			self.setNeedsUpdateOfHomeIndicatorAutoHidden();
		}
		self.mSetButtonTitle();
	}
	
	private func mSetButtonTitle() {
		
		if (self.pHideHomeIndicator) {
			pButton.setTitle("Show", for: .normal);
		} else {
			pButton.setTitle("Hide",for: .normal);
		}
	}
	
	override var prefersHomeIndicatorAutoHidden: Bool {
		
		return pHideHomeIndicator;
	}
}



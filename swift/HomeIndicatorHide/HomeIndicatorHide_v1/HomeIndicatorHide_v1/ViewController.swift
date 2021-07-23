//
//  ViewController.swift
//  HomeIndicatorHide_v1
//
//  Created by Alexandr Kirilov on 23.07.2021.
//

import UIKit

class ViewController: UIViewController {
	
	var pHideHomeIndicator: Bool = false;
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
	}
	
	override func viewDidAppear(_ animated: Bool) {
		
		super.viewDidAppear(animated);
		self.pHideHomeIndicator = true;
		self.setNeedsUpdateOfHomeIndicatorAutoHidden();
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		
		super.viewDidDisappear(animated);
		self.pHideHomeIndicator = false;
		self.setNeedsUpdateOfHomeIndicatorAutoHidden();
	}

	override var prefersHomeIndicatorAutoHidden: Bool {
		
		return pHideHomeIndicator;
	}
}


//
//  ViewControllerPrimitive.swift
//  UniversalUI
//
//  Created by Alexandr Kirilov on 02/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class ViewControllerPrimitive: UIViewController {
	
	let pApplication: UIApplication = UIApplication.shared;
	
//	override var preferredStatusBarStyle: UIStatusBarStyle {
//
//		return __STATUS_BAR_DEFAULT_STYLE;
//	}

    override func viewDidLoad() {
        
		super.viewDidLoad();
		view.backgroundColor = __DEFAULT_BACKGROUND_COLOR;
		
		if #available(iOS 11.0, *) {
			let guide = self.view.safeAreaLayoutGuide
			view.translatesAutoresizingMaskIntoConstraints = false;
			view.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
			view.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
			view.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
			view.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
		} else {
			// Fallback on earlier versions
		}
		
    }
	
	override func viewDidAppear(_ animated: Bool) {

		UIHandler.mDefineStatusBarBackground();
	}
}

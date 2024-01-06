//
//  AViewControllerTemplate.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import Foundation
import UIKit

class AViewControllerTemplate: UIViewController {

	var pViewContent: UIView = UIView();
	var pViewWarpper: UIView = UIView();
	
	override func loadView() {
		
		super.loadView();
		
		pViewWarpper.translatesAutoresizingMaskIntoConstraints = false;
		pViewWarpper.backgroundColor = __COLOR_GREEN_DARK;
		self.view.addSubview(pViewWarpper);
		
		pViewContent.translatesAutoresizingMaskIntoConstraints = false;
		pViewContent.backgroundColor = __COLOR_FIOLENT_LIGHT;
		pViewWarpper.addSubview(pViewContent);
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad();

		pViewWarpper.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true;
		pViewWarpper.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true;
		pViewWarpper.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true;
		pViewWarpper.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true;
		
		pViewContent.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true;
		pViewContent.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true;
		pViewContent.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true;
		pViewContent.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true;
	}
}

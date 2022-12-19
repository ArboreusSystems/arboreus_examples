//
//  AMainViewController.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import UIKit

class AMainViewController: AViewControllerTemplate {
	
	var pViewItems: AItemsCollectionView = AItemsCollectionView();
	
	override func loadView() {
		
		super.loadView();
		self.title = "StoreKit2 v1";
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
		
		pViewContent.addSubview(pViewItems);
		pViewItems.topAnchor.constraint(equalTo: pViewContent.topAnchor).isActive = true;
		pViewItems.bottomAnchor.constraint(equalTo: pViewContent.bottomAnchor).isActive = true;
		pViewItems.leftAnchor.constraint(equalTo: pViewContent.leftAnchor).isActive = true;
		pViewItems.rightAnchor.constraint(equalTo: pViewContent.rightAnchor).isActive = true;
	}
}

//
//  MainViewController.swift
//  UICollectionView
//
//  Created by Alexandr Kirilov on 18/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	private var pCollectionView: UICollectionView = DemoCollectionView() as UICollectionView;

	override func viewDidLoad() {
		
		super.viewDidLoad();
		view.backgroundColor = __COLOR_BLUE;
		
		view.addSubview(pCollectionView);
		pCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true;
		pCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true;
		pCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
		pCollectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true;
		pCollectionView.heightAnchor.constraint(equalToConstant: 300.0).isActive = true;
	}
}

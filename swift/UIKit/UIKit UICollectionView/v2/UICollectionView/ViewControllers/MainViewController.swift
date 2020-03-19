//
//  MainViewController.swift
//  UICollectionView
//
//  Created by Alexandr Kirilov on 18/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	private var pCollectionView: UICollectionView = UICollectionView();
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
		view.backgroundColor = __COLOR_BLUE;
		
		view.addSubview(pCollectionView);
		pCollectionView.center = view.center;
	}
}

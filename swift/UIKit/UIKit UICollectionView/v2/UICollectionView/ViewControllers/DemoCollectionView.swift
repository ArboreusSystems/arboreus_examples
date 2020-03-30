//
//  DemoCollectionView.swift
//  UICollectionView
//
//  Created by Alexandr Kirilov on 30/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class DemoCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	var pCells: [DemoCellModel] = [];
	
	init() {
	
		let oLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout();
		oLayout.scrollDirection = .horizontal;
		oLayout.minimumInteritemSpacing = CGFloat(20);
		super.init(frame: .zero, collectionViewLayout: oLayout);
		self.translatesAutoresizingMaskIntoConstraints = false;
		
		pCells = DemoData.mGet();
		
		delegate = self;
		dataSource = self;
		register(DemoCollectionViewCell.self, forCellWithReuseIdentifier: DemoCollectionViewCell.reusedId);
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return pCells.count;
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let oCell: DemoCollectionViewCell = dequeueReusableCell(withReuseIdentifier: DemoCollectionViewCell.reusedId, for: indexPath) as! DemoCollectionViewCell;
		oCell.pTitle.text = pCells[indexPath.row].Title;
		oCell.pDescription.text = pCells[indexPath.row].Description;
		oCell.backgroundColor = pCells[indexPath.row].Color;
		return oCell;
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: 250.0, height: 250.0);
	}
}

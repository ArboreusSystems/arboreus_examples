//
//  ExampleCollectionView.swift
//  UICollectionView
//
//  Created by Alexandr Kirilov on 18/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class ExampleCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
	
	let pData: [ExampleItem] = ExampleData.mGet();

	init() {
		
		let oLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout();
		oLayout.scrollDirection = .horizontal;
		super.init(frame: .zero, collectionViewLayout: oLayout);
		
		backgroundColor = __COLOR_WHITE;
		delegate = self;
		dataSource = self;
		register(ExampleCollectionViewCell.self, forCellWithReuseIdentifier: ExampleCollectionViewCell.reusedID);
		
		print(pData);
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented");
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return pData.count;
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = dequeueReusableCell(withReuseIdentifier: ExampleCollectionViewCell.reusedID, for: indexPath);
		return cell;
	}
}

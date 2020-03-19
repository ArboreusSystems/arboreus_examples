//
//  ExampleCollectionViewCell.swift
//  UICollectionView
//
//  Created by Alexandr Kirilov on 18/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {
	
	static let reusedID: String = "ExampleCollectionViewCell";
    
	override init(frame: CGRect) {
		
		super.init(frame: frame);
		backgroundColor = __COLOR_PURPLE;
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented");
	}
}

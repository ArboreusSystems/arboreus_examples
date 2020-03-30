//
//  DemoCollectionViewCell.swift
//  UICollectionView
//
//  Created by Alexandr Kirilov on 30/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class DemoCollectionViewCell: UICollectionViewCell {
	
	static let reusedId: String = "DemoCollectionViewCell";
	let pPadding: CGFloat = 10;
	
	let pTitle: UILabel = {
		
		let oLabel: UILabel = UILabel();
		oLabel.translatesAutoresizingMaskIntoConstraints = false;
		oLabel.backgroundColor = __COLOR_GREEN_LIGHT;
		oLabel.textColor = __COLOR_WHITE;
		oLabel.textAlignment = .center;
		oLabel.font = oLabel.font.withSize(25);
		return oLabel;
	}()
	
	let pDescription: UILabel = {
		
		let oLabel: UILabel = UILabel();
		oLabel.translatesAutoresizingMaskIntoConstraints = false;
		oLabel.backgroundColor = __COLOR_PURPLE;
		oLabel.textColor = __COLOR_WHITE;
		oLabel.textAlignment = .center;
		return oLabel;
	}()
	
	var pColor: UIColor = __COLOR_GREEN;

	override init(frame: CGRect) {
		
		super.init(frame: frame);
		self.backgroundColor = __COLOR_WHITE;
		self.translatesAutoresizingMaskIntoConstraints = false;
		
		addSubview(pTitle);
		pTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: pPadding).isActive = true;
		pTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: pPadding).isActive = true;
		pTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -pPadding).isActive = true;
		pTitle.heightAnchor.constraint(equalToConstant: 50.0).isActive = true;
		
		addSubview(pDescription);
		pDescription.topAnchor.constraint(equalTo: pTitle.bottomAnchor, constant: pPadding).isActive = true;
		pDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: pPadding).isActive = true;
		pDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -pPadding).isActive = true;
		pDescription.heightAnchor.constraint(equalToConstant: 100.0).isActive = true;
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented");
	}
}

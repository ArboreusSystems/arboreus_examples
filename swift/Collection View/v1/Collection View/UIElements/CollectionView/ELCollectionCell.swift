//
//  ELCollectionCell.swift
//  Collection View
//
//  Created by Alexandr Kirilov on 19/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class ELCollectionCell: UICollectionViewCell {

	let pTextGenerator: ADEFLoremIpsum = ADEFLoremIpsum();

	let pContent: UIView = {
	
		let oContent: UIView = UIView();
		oContent.backgroundColor = _COLOR_CLEAN_WHITE;
		oContent.translatesAutoresizingMaskIntoConstraints = false;
		return oContent;
	}();

	let pIcon: UIImageView = {
		
		let oImage: UIImageView = UIImageView();
		oImage.translatesAutoresizingMaskIntoConstraints = false;
		switch Int.random(in: 0...3) {
			case 0: oImage.image = UIImage(named: "CVIcon_001.pdf");
			case 1: oImage.image = UIImage(named: "CVIcon_002.pdf");
			case 2: oImage.image = UIImage(named: "CVIcon_003.pdf");
			default: oImage.image = UIImage(named: "CVIcon_004.pdf");
		}
		return oImage;
	}();
	
	let pText: UILabel = {
		
		let oText: UILabel = UILabel();
		oText.translatesAutoresizingMaskIntoConstraints = false;
		oText.textAlignment = NSTextAlignment.left;
		return oText;
	}();
	

	override init(frame: CGRect) {
		
		super.init(frame: frame);
		self.mSetupView();
	}
	
	required init?(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder);
	}
	
	private func mSetupView() -> Void {
		
		addSubview(pContent);
		NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
			withVisualFormat: "H:|-\(_COLLECTION_CELL_PADDING * 1.1)-[pContent]-\(_COLLECTION_CELL_PADDING * 1.1)-|",
			options: [], metrics: nil,
			views: ["pContent":pContent]
		));
		NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
			withVisualFormat: "V:|-\(_COLLECTION_CELL_PADDING * 0.3)-[pContent]-\(_COLLECTION_CELL_PADDING * 0.3)-|",
			options: [], metrics: nil,
			views: ["pContent":pContent]
		));
		
		pContent.addSubview(pIcon);
		pIcon.topAnchor.constraint(equalTo: pContent.topAnchor, constant: _COLLECTION_CELL_PADDING * 0.65).isActive = true;
		pIcon.bottomAnchor.constraint(equalTo: pContent.bottomAnchor, constant: -_COLLECTION_CELL_PADDING * 0.65).isActive = true;
		pIcon.leftAnchor.constraint(equalTo: pContent.leftAnchor, constant: _COLLECTION_CELL_PADDING * 0.65).isActive = true
		pIcon.widthAnchor.constraint(equalTo: pIcon.heightAnchor).isActive = true;
		
		addSubview(pText);
		pText.text = pTextGenerator.mCreateText(
			inDictionary: pTextGenerator.mCreateDictionary(inDictionary: nil), inLength: 3
		);
		pText.centerYAnchor.constraint(equalTo: pIcon.centerYAnchor).isActive = true;
		pText.leftAnchor.constraint(equalTo: pIcon.rightAnchor, constant: _COLLECTION_CELL_PADDING).isActive = true;
		pText.rightAnchor.constraint(equalTo: pContent.rightAnchor, constant: -_COLLECTION_CELL_PADDING).isActive = true;
		
		print("ELCollectionCell.mSetupView()");
	}
}

//
//  AButtonTemplate.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import UIKit

class AButtonTemplate: UIButton {

	override init(frame: CGRect) {
		
		super.init(frame: frame);
		self.translatesAutoresizingMaskIntoConstraints = false;
		self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0);
		
		self.setTitleColor(__COLOR_WHITE, for: UIControl.State.normal);
		self.mSetBackgroundColor(__COLOR_PURPLE_DARK, for: UIControl.State.normal);
		
		self.setTitleColor(__COLOR_LEMON_LIGHT, for: UIControl.State.highlighted);
		self.mSetBackgroundColor(__COLOR_ORANGE_DARK, for: UIControl.State.highlighted);
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

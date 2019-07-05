//
//  APRLabel.swift
//  Custom UI
//
//  Created by Alexandr Kirilov on 04/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class APRLabel: UILabel {

	let pDefaultFont: UIFont = _FONT_DEFAULT;

	override init(frame: CGRect) {
		super.init(frame: frame);
		self.font = pDefaultFont;
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.font = pDefaultFont;
	}
}

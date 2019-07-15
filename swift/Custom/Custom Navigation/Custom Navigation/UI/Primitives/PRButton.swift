//
//  PRButton.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 2019-07-15.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class PRButton: UIButton {

	let pDefaultFont: UIFont = _FONT_BOLD(20);

	override init(frame: CGRect) {
		super.init(frame: frame);
		self.titleLabel?.font = pDefaultFont;
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
		self.titleLabel?.font = pDefaultFont;
	}
}

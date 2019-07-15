//
//  PRLabel.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 2019-07-15.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class PRLabel: UILabel {

	let pDefaultFont: UIFont = _FONT_DEFAULT;

	override init(frame: CGRect) {
		
		super.init(frame: frame);
		self.mSetDefault();
	}

	required init?(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder);
		self.mSetDefault();
	}
	
	private func mSetDefault() -> Void {
		
		self.font = pDefaultFont;
		self.textAlignment = NSTextAlignment.center;
	}
}

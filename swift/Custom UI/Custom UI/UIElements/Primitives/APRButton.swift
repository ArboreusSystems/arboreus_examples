/**

# Class: APRButton

* Created 07/02/2019 at 19:08
* Author Alexandr KIRILOV, http://alexandr.kirilov.me
* Copyright (c) 2011-2019 Arboreus Systems (http://arboreus.systems). All rights reserved.
 

UI Element Primitive: UIButton within customised properties

*/


import UIKit


class APRButton: UIButton {

	let pDefaultFont: UIFont = _FONT_DEFAULT;

	override init(frame: CGRect) {
		super.init(frame: frame);
		self.titleLabel?.font = pDefaultFont;
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
		self.titleLabel?.font = pDefaultFont;
	}
}

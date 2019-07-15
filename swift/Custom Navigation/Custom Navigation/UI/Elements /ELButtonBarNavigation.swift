//
//  ELButtonBarNavigation.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 2019-07-15.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class ELButtonBarNavigation: PRButton {

	override init(frame: CGRect) {

		super.init(frame: frame);
		mDefineButton();
	}

	required init?(coder aDecoder: NSCoder) {

		super.init(coder: aDecoder);
		mDefineButton();
	}

	private func mDefineButton() -> Void {

		self.setTitleColor(_COLOR_WHITE, for: .focused);
		self.setBackgroundImage(UIImage(named: "DemoButtonNormal")!, for: .normal);
		self.setBackgroundImage(UIImage(named: "DemoButtonPressed")!, for: .highlighted);
	}
}

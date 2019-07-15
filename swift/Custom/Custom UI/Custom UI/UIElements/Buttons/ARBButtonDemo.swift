//
//  ARBButtonDemo.swift
//  Custom UI
//
//  Created by Alexandr Kirilov on 06/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class ARBButtonDemo: APRButton {

	override func draw(_ rect: CGRect) {
		
		self.setBackgroundImage(UIImage(named: "DemoButtonNormal.pdf")!, for: .normal);
		self.setBackgroundImage(UIImage(named: "DemoButtonPressed.pdf")!, for: .focused);
	}

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

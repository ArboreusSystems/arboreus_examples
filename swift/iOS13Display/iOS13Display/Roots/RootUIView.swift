//
//  RootUIView.swift
//  iOS13Display
//
//  Created by Alexandr Kirilov on 08/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

import UIKit

class RootUIView: UIView {
	
	convenience init() {
		
		self.init(frame: CGRect.zero);
	}
	
	override init(frame: CGRect) {
		
		super.init(frame: frame);
		if #available(iOS 13.0, *) {
			self.overrideUserInterfaceStyle = .light;
		}
		if #available(iOS 11.0, *) {
			self.accessibilityIgnoresInvertColors = true;
		}
	}
	
	required init(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented");
	}
}

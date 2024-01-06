//
//  UIButtonExtension.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import UIKit

extension UIButton {

	func mSetBackgroundColor(_ color: UIColor, for forState: UIControl.State) {
	
		UIGraphicsBeginImageContext(CGSize(width: 1, height: 1));
		UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor);
		UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1));
		let colorImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
		self.setBackgroundImage(colorImage, for: forState);
	}
}

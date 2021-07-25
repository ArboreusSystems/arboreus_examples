//
//  UIButtonExtension.swift
//  HomeIndicatorHide_v2
//
//  Created by Alexandr Kirilov on 25.07.2021.
//

import UIKit

extension UIButton {
	
	func mSetBackgroundColor(inColor: UIColor, inState: UIControl.State) {
		
		UIGraphicsBeginImageContext(CGSize(width: 1, height: 1));
		UIGraphicsGetCurrentContext()!.setFillColor(inColor.cgColor);
		UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1));
		let oColorImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext()
		
		self.setBackgroundImage(oColorImage, for: inState);
	}
}

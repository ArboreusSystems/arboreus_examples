//
//  UIColorExtension.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 18/12/2022.
//

import UIKit

extension UIColor {

	convenience init(inHex: String) {
	
		let oHex = inHex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted);
		var oInt = UInt64();
		
		Scanner(string: oHex).scanHexInt64(&oInt)
        
		var oAlpha: UInt64 = 0;
		var oRed: UInt64 = 0;
		var oGreen: UInt64 = 0;
		var oBlue: UInt64 = 0;
        
		switch oHex.count {
			case 3:
				(oAlpha, oRed, oGreen, oBlue) = (255, (oInt >> 8) * 17, (oInt >> 4 & 0xF) * 17, (oInt & 0xF) * 17);
			case 6:
				(oAlpha, oRed, oGreen, oBlue) = (255, oInt >> 16, oInt >> 8 & 0xFF, oInt & 0xFF);
			case 8:
				(oAlpha, oRed, oGreen, oBlue) = (oInt >> 24, oInt >> 16 & 0xFF, oInt >> 8 & 0xFF, oInt & 0xFF);
			default:
				(oAlpha, oRed, oGreen, oBlue) = (255, 0, 0, 0);
		}
		
		self.init(
			red: CGFloat(oRed) / 255,
			green: CGFloat(oGreen) / 255,
			blue: CGFloat(oBlue) / 255,
			alpha: CGFloat(oAlpha) / 255
		);
	}
}

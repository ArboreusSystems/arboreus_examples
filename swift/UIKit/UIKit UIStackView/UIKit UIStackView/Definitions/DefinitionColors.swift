//
//  DefinitionColors.swift
//  UIKit UIStackView
//
//  Created by Alexandr Kirilov on 10/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

let __COLOR_WHITE: UIColor = UIColor.init(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1);
let __COLOR_CLEAN_WHITE: UIColor = UIColor.init(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1);

let __COLOR_BLACK: UIColor = UIColor.init(red: 7.0 / 255.0, green: 7.0 / 255.0, blue: 7.0 / 255.0, alpha: 1);
let __COLOR_BLACK_DARK: UIColor = UIColor.init(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1);

let __COLOR_GREEN: UIColor = UIColor.init(red: 24.0 / 255.0, green: 107.0 / 255.0, blue: 47.0 / 255.0, alpha: 1);
let __COLOR_GREEN_DARK: UIColor = UIColor.init(red: 7.0 / 255.0, green: 69.0 / 255.0, blue: 24.0 / 255.0, alpha: 1);
let __COLOR_GREEN_LIGHT: UIColor = UIColor.init(red: 44.0 / 255.0, green: 136.0 / 255.0, blue: 69.0 / 255.0, alpha: 1);

let __COLOR_PURPLE: UIColor = UIColor.init(red: 144.0 / 255.0, green: 10.0 / 255.0, blue: 91.0 / 255.0, alpha: 1);
let __COLOR_PURPLE_DARK: UIColor = UIColor.init(red: 94.0 / 255.0, green: 8.0 / 255.0, blue: 60.0 / 255.0, alpha: 1);
let __COLOR_PURPLE_LIGHT: UIColor = UIColor.init(red: 178.0 / 255.0, green: 24.0 / 255.0, blue: 117.0 / 255.0, alpha: 1);

let __COLOR_BLUE: UIColor = UIColor.init(red: 80.0 / 255.0, green: 162.0 / 255.0, blue: 217.0 / 255.0, alpha: 1);
let __COLOR_BLUE_DARK: UIColor = UIColor.init(red: 24.0 / 255.0, green: 100.0 / 255.0, blue: 151.0 / 255.0, alpha: 1);
let __COLOR_BLUE_LIGHT: UIColor = UIColor.init(red: 92.0 / 255.0, green: 187.0 / 255.0, blue: 251.0 / 255.0, alpha: 1);

class DefinitionColors: NSObject {

	static func mRandom() -> UIColor {
		
		return UIColor.init(
			red: CGFloat.random(in: 0...255),
			green: CGFloat.random(in: 0...255),
			blue: CGFloat.random(in: 0...255),
			alpha: 1
		);
	}
}

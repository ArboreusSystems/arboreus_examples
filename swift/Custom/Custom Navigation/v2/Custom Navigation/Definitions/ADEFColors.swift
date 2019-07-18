//
//  ADEFColors.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 18/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit


let _COLOR_WHITE: UIColor = ADEFColors.mWhite();
let _COLOR_CLEAN_WHITE: UIColor = ADEFColors.mCleanWhite();

let _COLOR_BLACK: UIColor = ADEFColors.mBlack();
let _COLOR_BLACK_DARK: UIColor = ADEFColors.mBlackDark();

let _COLOR_GREEN: UIColor = ADEFColors.mGreen();
let _COLOR_GREEN_DARK: UIColor = ADEFColors.mGreenDark();
let _COLOR_GREEN_LIGHT: UIColor = ADEFColors.mGreenLight();

let _COLOR_PURPLE: UIColor = ADEFColors.mPurple();
let _COLOR_PURPLE_DARK: UIColor = ADEFColors.mPurpleDark();
let _COLOR_PURPLE_Light: UIColor = ADEFColors.mPurpleLight();

let _COLOR_BLUE: UIColor = ADEFColors.mBlue();
let _COLOR_BLUE_DARK: UIColor = ADEFColors.mBlueDark();
let _COLOR_BLUE_LIGHT: UIColor = ADEFColors.mBlueLight();


class ADEFColors: NSObject {

	static public func mWhite() -> UIColor {
		return UIColor.init(red: 240.0 / 255.0,	green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1);
	}

	static public func mCleanWhite() -> UIColor {
		return UIColor.init(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1);
	}

	static public func mBlack() -> UIColor {
		return UIColor.init(red: 7.0 / 255.0, green: 7.0 / 255.0, blue: 7.0 / 255.0, alpha: 1);
	}

	static public func mBlackDark() -> UIColor {
		return UIColor.init(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1);
	}

	static public func mGreen() -> UIColor {
		return UIColor.init(red: 24.0 / 255.0, green: 107.0 / 255.0, blue: 47.0 / 255.0, alpha: 1);
	}

	static public func mGreenDark() -> UIColor {
		return UIColor.init(red: 7.0 / 255.0, green: 69.0 / 255.0, blue: 24.0 / 255.0, alpha: 1);
	}

	static public func mGreenLight() -> UIColor {
		return UIColor.init(red: 44.0 / 255.0, green: 136.0 / 255.0, blue: 69.0 / 255.0, alpha: 1);
	}

	static public func mPurple() -> UIColor {
		return UIColor.init(red: 144.0 / 255.0, green: 10.0 / 255.0, blue: 91.0 / 255.0, alpha: 1);
	}

	static public func mPurpleDark() -> UIColor {
		return UIColor.init(red: 94.0 / 255.0, green: 8.0 / 255.0, blue: 60.0 / 255.0, alpha: 1);
	}

	static public func mPurpleLight() -> UIColor {
		return UIColor.init(red: 178.0 / 255.0, green: 24.0 / 255.0, blue: 117.0 / 255.0, alpha: 1);
	}

	static public func mBlue() -> UIColor {
		return UIColor.init(red: 80.0 / 255.0, green: 162.0 / 255.0, blue: 217.0 / 255.0, alpha: 1);
	}

	static public func mBlueDark() -> UIColor {
		return UIColor.init(red: 24.0 / 255.0, green: 100.0 / 255.0, blue: 151.0 / 255.0, alpha: 1);
	}

	static public func mBlueLight() -> UIColor {
		return UIColor.init(red: 92.0 / 255.0, green: 187.0 / 255.0, blue: 251.0 / 255.0, alpha: 1);
	}
}

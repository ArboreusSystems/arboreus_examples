/**

# Class: ADEFFonts

* Created 07/02/2019 at 17:13
* Author Alexandr KIRILOV, http://alexandr.kirilov.me
* Copyright (c) 2011-2019 Arboreus Systems (http://arboreus.systems). All rights reserved.
 

Define default application fonts

*/


import UIKit


let _FONT_DEFAULT_SIZE: CGFloat = 16.0;

let _FONT_DEFAULT: UIFont = ADEFFonts.mRegular(inSize: _FONT_DEFAULT_SIZE);
let _FONT_DEFAULT_BOLD: UIFont = ADEFFonts.mBold(inSize: _FONT_DEFAULT_SIZE);
let _FONT_DEFAULT_ITALIC: UIFont = ADEFFonts.mItalic(inSize: _FONT_DEFAULT_SIZE);
let _FONT_DEFAULT_BOLD_ITALIC: UIFont = ADEFFonts.mBoldItalic(inSize: _FONT_DEFAULT_SIZE);

let _FONT: (CGFloat) -> UIFont = {(inSize:CGFloat) -> UIFont in return ADEFFonts.mRegular(inSize: inSize)}
let _FONT_BOLD: (CGFloat) -> UIFont = {(inSize:CGFloat) -> UIFont in return ADEFFonts.mBold(inSize: inSize)}
let _FONT_ITALIC: (CGFloat) -> UIFont = {(inSize:CGFloat) -> UIFont in return ADEFFonts.mItalic(inSize: inSize)}
let _FONT_BOLD_ITALIC: (CGFloat) -> UIFont = {(inSize:CGFloat) -> UIFont in return ADEFFonts.mItalic(inSize: inSize)}


class ADEFFonts {

	static public func mRegular(inSize:CGFloat) -> UIFont {
		return UIFont(name: "Mohave-Regular", size: inSize)!; 
	}

	static public func mItalic(inSize:CGFloat) -> UIFont {
		return UIFont(name: "Mohave-Italic", size: inSize)!;
	}

	static public func mBold(inSize:CGFloat) -> UIFont {
		return UIFont(name: "Mohave-Bold", size: inSize)!;
	}

	static public func mBoldItalic(inSize:CGFloat) -> UIFont {
		return UIFont(name: "Mohave-BoldItalic", size: inSize)!;
	}
}

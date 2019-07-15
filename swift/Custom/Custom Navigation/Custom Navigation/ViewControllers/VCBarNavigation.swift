//
//  VCBarNavigation.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 2019-07-15.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCBarNavigation: UIViewController {

	var pMainView: Optional<VCMain> = nil;
	var pBarHeight: CGFloat = 0;
	var pBarWidth: CGFloat = 0;
	var pButtonSize: CGFloat = 0;
	var pPadding: CGFloat = 0;

	override func loadView() {

		super.loadView();
		self.view.backgroundColor = _COLOR_GREEN;
		self.view.translatesAutoresizingMaskIntoConstraints = false;
	}

	override func viewDidLayoutSubviews() {

		super.viewDidLayoutSubviews();
		
		pBarHeight = self.view.frame.height;
		pBarWidth = self.view.frame.width;
		pButtonSize = pBarHeight * 0.8;
		pPadding = (pBarHeight - pButtonSize) / 2;

		let oButtonPage1: ELButtonBarNavigation = ELButtonBarNavigation(frame: CGRect(
			x: pBarWidth - pPadding - pButtonSize,
			y: pPadding,
			width: pButtonSize,
			height: pButtonSize
		));
		oButtonPage1.setTitle("1", for: .normal);
		oButtonPage1.addTarget(self, action: #selector(mShowPage1(_:)), for: .touchUpInside);
		self.view.addSubview(oButtonPage1);
		
		let oButtonPage2: ELButtonBarNavigation = ELButtonBarNavigation(frame: CGRect(
			x: pBarWidth - pPadding * 2 - pButtonSize * 2,
			y: pPadding,
			width: pButtonSize,
			height: pButtonSize
		));
		oButtonPage2.setTitle("2", for: .normal);
		oButtonPage2.addTarget(self, action: #selector(mShowPage2(_:)), for: .touchUpInside);
		self.view.addSubview(oButtonPage2);
		
		let oButtonPage3: ELButtonBarNavigation = ELButtonBarNavigation(frame: CGRect(
			x: pBarWidth - pPadding * 3 - pButtonSize * 3,
			y: pPadding,
			width: pButtonSize,
			height: pButtonSize
		));
		oButtonPage3.setTitle("3", for: .normal);
		oButtonPage3.addTarget(self, action: #selector(mShowPage3(_:)), for: .touchUpInside);
		self.view.addSubview(oButtonPage3);
		
		let oButtonExit: UIButton = UIButton(frame: CGRect(
			x: pPadding,
			y: pPadding,
			width: pButtonSize * 3,
			height: pButtonSize
		));
		oButtonExit.backgroundColor = _COLOR_WHITE;
		oButtonExit.setTitle("Exit", for: .normal);
		oButtonExit.setTitleColor(_COLOR_GREEN, for: .normal);
		oButtonExit.addTarget(self, action: #selector(mDoExit(_:)), for: .touchUpInside);
		self.view.addSubview(oButtonExit);
	}
	
	@objc func mShowPage1(_ inSender: Any) -> Void {

		print("Show Page 1");
		if (pMainView != nil) {pMainView!.mShowPage(inPage: PageIDs.Page1);}
	}
	
	@objc func mShowPage2(_ inSender: Any) -> Void {

		print("Show Page 2");
		if (pMainView != nil) {pMainView!.mShowPage(inPage: PageIDs.Page2);}
	}
	
	@objc func mShowPage3(_ inSender: Any) -> Void {
	
		print("Show Page 3");
		if (pMainView != nil) {pMainView!.mShowPage(inPage: PageIDs.Page3);}
	}
	
	@objc func mDoExit(_ inSender: Any) -> Void {
	
		MainHandler.mDoExit();
	}
}

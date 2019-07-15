//
//  VCMain.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 2019-07-15.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

enum PageIDs: Int {
	case Page1;
	case Page2;
	case Page3;
}

class VCMain: UIViewController {

	var pScreenWidth: CGFloat = 0;
	var pScreenHeight: CGFloat = 0;

	let pNavigation: VCBarNavigation = VCBarNavigation();
	var pContent: Optional<PRContentView> = nil;
	var pStack: [PageIDs:PRContentView] = [:];
	let pDefaultPage: PageIDs = PageIDs.Page1;

	override func loadView() {

		super.loadView();
		pNavigation.pMainView = self;
		self.view.backgroundColor = _COLOR_WHITE;
		self.view.translatesAutoresizingMaskIntoConstraints = false;
		mRegisterPagesInStack();
		mDefaultPage();
	}

	override func viewDidLayoutSubviews() {

		super.viewDidLayoutSubviews();

		pNavigation.pMainView = self;
		self.view.addSubview(pNavigation.view);
		pNavigation.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true;
		pNavigation.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true;
		pNavigation.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true;
		pNavigation.view.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: pScreenHeight * 0.08).isActive = true;

		if (pContent != nil) {
			self.view.addSubview(pContent!.view);
			pContent!.view.topAnchor.constraint(equalTo: pNavigation.view.bottomAnchor).isActive = true;
			pContent!.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true;
			pContent!.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true;
			pContent!.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true;
		}
	}

	func mShowPage(inPage: PageIDs) -> Void {

		print("mShowPage: \(inPage)");
		if (pContent != nil) {
			self.pContent!.view.removeFromSuperview();
		}
		pContent = pStack[inPage];
		self.view.addSubview(pContent!.view);
	}

	private func mRegisterPagesInStack() -> Void {

		let oPage1: VCPage1 = VCPage1(); oPage1.pMainView = self;
		pStack.updateValue(oPage1, forKey: PageIDs.Page1);
		let oPage2: VCPage2 = VCPage2(); oPage2.pMainView = self;
		pStack.updateValue(oPage2, forKey: PageIDs.Page2);
		let oPage3: VCPage3 = VCPage3(); oPage3.pMainView = self;
		pStack.updateValue(oPage3, forKey: PageIDs.Page3);
	}

	private  func mDefaultPage() -> Void {

		mShowPage(inPage: pDefaultPage);
	}
}

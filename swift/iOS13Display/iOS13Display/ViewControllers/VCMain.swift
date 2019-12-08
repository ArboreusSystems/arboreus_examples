//
//  VCMain.swift
//  iOS13Display
//
//  Created by Alexandr Kirilov on 08/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

import UIKit

class VCMain: RootUIViewController {

    let pScreenWidth: CGFloat = UIScreen.main.bounds.width;
    let pScreenHeight: CGFloat = UIScreen.main.bounds.height;
    let pElementX: CGFloat = (UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 0.8)) / 2;
    let pElementWidth: CGFloat = UIScreen.main.bounds.width * 0.8;
    
	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = _COLOR_WHITE;
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
		
		self.view.addSubview(mLabel(inText: "Swift", inY: 0.1, inHeight: 0.05));
		self.view.addSubview(mLabel(inText: "iOS 13 Display & Text size", inY: 0.15, inHeight: 0.1));
		self.mButtonExit();
	}
	
	private func mButtonExit() -> Void {

		let oButton: UIButton = UIButton(frame: mCreateFrame(inY: 0.85, inHeight: 0.1));
		oButton.backgroundColor = UIColor.init(
			red: 10.0 / 255, green: 107.0 / 255.0, blue: 62 / 255.0, alpha: 1
		);
		oButton.setTitleColor(.white, for: .normal);
		oButton.setTitle("Exit", for: .normal);
		oButton.addTarget(self, action: #selector(mDoExit(_:)), for: .touchUpInside);
		self.view.addSubview(oButton);
	}
	
	private func mLabel(inText: String, inY: CGFloat, inHeight: CGFloat) -> UILabel {

		let oLabel: UILabel = UILabel.init(frame: mCreateFrame(inY: inY, inHeight: inHeight));
		oLabel.text = inText;
		oLabel.textAlignment = NSTextAlignment.center;
		return oLabel;
	}
	
	private func mCreateFrame(inY: CGFloat, inHeight: CGFloat) -> CGRect {

		return CGRect.init(
			x: pElementX, y: pScreenHeight * inY,
			width: pElementWidth, height: pScreenHeight * inHeight
		);
	}
	
	@objc func mDoExit(_ inSender: Any) -> Void {

		MainHandler.mDoExit();
	}
}

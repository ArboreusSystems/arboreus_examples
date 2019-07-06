//
//  MainViewController.swift
//  Custom UI
//
//  Created by Alexandr Kirilov on 2019-07-03.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class MainViewController: APRViewController {

	override func viewDidLayoutSubviews() {
	
		super.viewDidLayoutSubviews();
		
		print("pScreenWidth: ",pScreenWidth);
        print("pScreenWidth: ",pScreenHeight);
        print("pElementX: ",pElementX);
        print("pElementWidth: ",pElementWidth);
		
        self.mButtonExit();
        pView.addSubview(mLabel(inText: "Swift", inY: 0.1, inHeight: 0.05));
		pView.addSubview(mLabel(inText: "Custom UI", inY: 0.15, inHeight: 0.1));
		
		self.mButtonDemo(inSize:100);
	}
	
    // MARK: UI Elements
	
    private func mButtonDemo(inSize: CGFloat) -> Void {
		
		let oDemoButton: UIButton = UIButton(frame: CGRect(
			x: (pScreenWidth - inSize) / 2,
			y: (pScreenHeight - inSize) / 2,
			width: inSize, height: inSize
		));
		let oBackgroundImageNormal: UIImage = UIImage(named: "DemoButtonNormal")!;
		let oBackgroundImagePressed: UIImage = UIImage(named: "DemoButtonPressed")!;
		oDemoButton.setBackgroundImage(oBackgroundImageNormal, for: .normal);
		oDemoButton.setBackgroundImage(oBackgroundImagePressed, for: .highlighted);
		pView.addSubview(oDemoButton);
	}
	
	private func mButtonExit() -> Void {

		let oButton: APRButton = APRButton(frame: mCreateFrame(inY: 0.87, inHeight: 0.07));
		oButton.backgroundColor = UIColor.init(
			red: 10.0 / 255, green: 107.0 / 255.0, blue: 62 / 255.0, alpha: 1
		);
		oButton.setTitleColor(.white, for: .normal);
		oButton.setTitle("Exit", for: .normal);
		oButton.addTarget(self, action: #selector(mDoExit(_:)), for: .touchUpInside);
		pView.addSubview(oButton);
	}
	
	private func mLabel(inText: String, inY: CGFloat, inHeight: CGFloat) -> APRLabel {

		let oLabel: APRLabel = APRLabel.init(frame: mCreateFrame(inY: inY, inHeight: inHeight));
		oLabel.text = inText;
		oLabel.textAlignment = NSTextAlignment.center;
		return oLabel;
	}
	
	private func mCreateSquare(inSideSize: CGFloat, inY: CGFloat) -> CGRect {
	
		return CGRect.init(
			x: (pScreenWidth - inSideSize) / 2,
			y: pScreenHeight * inY,
			width: inSideSize,
			height: inSideSize
		);
	}
	
	private func mCreateFrame(inY: CGFloat, inHeight: CGFloat) -> CGRect {

		return CGRect.init(
			x: pElementX, y: pScreenHeight * inY,
			width: pElementWidth, height: pScreenHeight * inHeight
		);
	}
	
	// MARK: Button Actions

	@objc func mDoExit(_ inSender: Any) -> Void {

		MainHandler.mDoExit();
	}
}

//
//  MainViewController.swift
//  Localisation
//
//  Created by Alexandr Kirilov on 28/02/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	var pScreenWidth: CGFloat = 0;
	var pScreenHeight: CGFloat = 0;
	var pElementX: CGFloat = 0;
	var pElementWidth: CGFloat = 0;
	
    override func viewDidLoad() {
        
		super.viewDidLoad()
		view.backgroundColor = _COLOR_WHITE;
	}
	
	override func viewDidLayoutSubviews() {
		
		super.viewDidLayoutSubviews();
		
		pScreenWidth = view.bounds.width;
		pScreenHeight = view.bounds.height;
		pElementX = (pScreenWidth - (pScreenWidth * 0.8)) / 2;
		pElementWidth = pScreenWidth * 0.8;
		
		mButtonExit();
        view.addSubview(mLabel(inText: "Swift examples", inY: 0.1, inHeight: 0.05));
		view.addSubview(mLabel(inText: "Localisation", inY: 0.15, inHeight: 0.1));
	}
	
	// MARK: UI Elements
	

	
	private func mButtonExit() -> Void {

		let oButton: UIButton = UIButton(frame: mCreateFrame(inY: 0.87, inHeight: 0.07));
		oButton.backgroundColor = _COLOR_BLUE_DARK;
		oButton.setTitleColor(.white, for: .normal);
		oButton.setTitle("Exit", for: .normal);
		oButton.addTarget(self, action: #selector(mDoExit(_:)), for: .touchUpInside);
		view.addSubview(oButton);
	}
	
	private func mLabel(inText: String, inY: CGFloat, inHeight: CGFloat) -> UILabel {

		let oLabel: UILabel = UILabel(frame: mCreateFrame(inY: inY, inHeight: inHeight));
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

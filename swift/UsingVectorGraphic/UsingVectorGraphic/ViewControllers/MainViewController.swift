//
//  MainViewController.swift
//  UsingVectorGraphic
//
//  Created by Alexandr Kirilov on 03/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	let pScreenWidth: CGFloat = UIScreen.main.bounds.width;
	let pScreenHeight: CGFloat = UIScreen.main.bounds.height;
	let pElementX: CGFloat = (UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 0.8)) / 2;
	let pElementWidth: CGFloat = UIScreen.main.bounds.width * 0.8;

	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = UIColor.white;
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
		self.mButtonExit();
		self.view.addSubview(mLabel(inText: "Swift", inY: 0.1, inHeight: 0.05));
		self.view.addSubview(mLabel(inText: "Vector Images (PDF) Usage ", inY: 0.15, inHeight: 0.1));

		let oImage: UIImage = UIImage(named: "DemoVectorLogo")!;
		print("Original image -> Width: ",oImage.size.width," Height: ",oImage.size.height);

		let oImageViewSmall: UIImageView = UIImageView(frame: mCreateSquare(inSideSize: 50, inY: 0.26));
		oImageViewSmall.image = oImage;
		print("Small image -> Width: ",oImage.size.width," Height: ",oImage.size.height);
		print("Small image View -> Width: ",oImageViewSmall.frame.width," Height: ",oImageViewSmall.frame.height);
		oImageViewSmall.contentMode = .scaleToFill;
		self.view.addSubview(oImageViewSmall);
		
		let oImageViewMiddle: UIImageView = UIImageView(frame: mCreateSquare(inSideSize: 100, inY: 0.36));
		oImageViewMiddle.image = oImage;
		print("Middle image -> Width: ",oImage.size.width," Height: ",oImage.size.height);
		print("Middle image View -> Width: ",oImageViewMiddle.frame.width," Height: ",oImageViewMiddle.frame.height);
		oImageViewMiddle.contentMode = .scaleToFill;
		self.view.addSubview(oImageViewMiddle);
		
		let oImageViewBig: UIImageView = UIImageView(frame: mCreateSquare(inSideSize: 150, inY: 0.55));
		oImageViewBig.image = oImage;
		print("Big image -> Width: ",oImage.size.width," Height: ",oImage.size.height);
		print("Big image View -> Width: ",oImageViewBig.frame.width," Height: ",oImageViewBig.frame.height);
		oImageViewBig.contentMode = .scaleToFill;
		self.view.addSubview(oImageViewBig);
	}
	
	// MARK: UI Elements
	
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

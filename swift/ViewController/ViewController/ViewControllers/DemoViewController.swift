//
//  DemoViewController.swift
//  ViewController
//
//  Created by Alexandr Kirilov on 06/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

	var pScreenWidth: CGFloat = 0;
	var pScreenHeight: CGFloat = 0;
	var pElementX: CGFloat = 0;
	var pElementWidth: CGFloat = 0;
	
	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = UIColor.white;
		
		print("DemoViewController:loadView()");
	}
	
	override func viewDidLoad() {
		
        super.viewDidLoad()
		print("DemoViewController:viewDidLoad()");
    }
	
    override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(animated);
		print("DemoViewController:viewWillAppear(_ animated: Bool)");
	}
	
	override func viewWillLayoutSubviews() {
		
		super.viewWillLayoutSubviews();
		print("DemoViewController:viewWillLayoutSubviews()");
	}
	
	override func viewDidLayoutSubviews() {

		super.viewDidLayoutSubviews();
		
		pScreenWidth = self.view.bounds.width;
		pScreenHeight = self.view.bounds.height;
		pElementX = (pScreenWidth - (pScreenWidth * 0.8)) / 2;
		pElementWidth = pScreenWidth * 0.8;
		
		mButtonExit();
		self.view.addSubview(mLabel(inText: "Swift", inY: 0.1, inHeight: 0.05));
		self.view.addSubview(mLabel(inText: "View Controller Lifecycle", inY: 0.15, inHeight: 0.1));
		
		print("DemoViewController:viewDidLayoutSubviews()");
	}
	
	override func viewDidAppear(_ animated: Bool) {

		super.viewDidAppear(animated);
		print("DemoViewController:viewDidAppear(animated)");
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		
		super.viewWillDisappear(animated);
		print("DemoViewController:viewWillDisappear()");
	}
	
	override func loadViewIfNeeded() {
		
		super.loadViewIfNeeded();
		print("DemoViewController:loadViewIfNeeded()");
	}
	
	override func viewDidDisappear(_ animated: Bool) {

		super.viewDidDisappear(animated);
		print("DemoViewController:viewDidDisappear(animated)");
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

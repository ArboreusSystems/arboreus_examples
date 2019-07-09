//
//  MainViewController.swift
//  Thread
//
//  Created by Alexandr Kirilov on 06/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	var pScreenWidth: CGFloat = 0;
	var pScreenHeight: CGFloat = 0;
	var pElementX: CGFloat = 0;
	var pElementWidth: CGFloat = 0;
	
	override func loadView() {
		
		super.loadView();
		view.backgroundColor = UIColor.white;
	}
	
    override func viewDidLayoutSubviews() {
		
		super.viewDidLayoutSubviews();
		
		pScreenWidth = view.bounds.width;
		pScreenHeight = view.bounds.height;
		pElementX = (pScreenWidth - (pScreenWidth * 0.8)) / 2;
		pElementWidth = pScreenWidth * 0.8;
		
		mButtonExit();
        view.addSubview(mLabel(inText: "Swift examples", inY: 0.1, inHeight: 0.05));
		view.addSubview(mLabel(inText: "Thread", inY: 0.15, inHeight: 0.1));
		
//		ThreadHandler.mDoPosix();
//		ThreadHandler.mDoNSThread();

//		ThreadQOSHandler.mDoTest();
//		ThreadQOSHandler.mDoNSThread();
		
		let oSyncMutex: ThreadSyncMutexHandler = ThreadSyncMutexHandler();
//		oSyncMutex.mDoDemoPosix();
		oSyncMutex.mDoDemoNSlock();
	}
	
	// MARK: UI Elements
	
	private func mButtonExit() -> Void {

		let oButton: UIButton = UIButton(frame: mCreateFrame(inY: 0.87, inHeight: 0.07));
		oButton.backgroundColor = UIColor.init(
			red: 10.0 / 255, green: 107.0 / 255.0, blue: 62 / 255.0, alpha: 1
		);
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

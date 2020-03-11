//
//  MainViewController.swift
//  Gestures
//
//  Created by Alexandr Kirilov on 11/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	var pLabelGesture: UILabel = UILabel.init();
	
	override func viewDidLoad() -> Void {
		
		super.viewDidLoad();
		view.backgroundColor = __COLOR_WHITE;
		mDefineSwipeHandler();
		mDefineLabel();
    }
	
	@objc func mSwipeHandler(inGestureRecognizer: UISwipeGestureRecognizer) -> Void {
		
		if (inGestureRecognizer.state == .ended) {
			switch (inGestureRecognizer.direction) {
				case .right: pLabelGesture.text = "Swipe: right"; break;
				case .left: pLabelGesture.text = "Swipe: left"; break;
				case .up: pLabelGesture.text = "Swipe: up"; break;
				case .down: pLabelGesture.text = "Swipe: down";	break;
				default: break;
			}
			view.backgroundColor = Color.mRandom();
		}
	}
	
	private func mDefineSwipeHandler() -> Void {
		
		let pSwipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(
			target: self, action: #selector(mSwipeHandler(inGestureRecognizer:))
		);
		pSwipeRight.direction = .right;
		view.addGestureRecognizer(pSwipeRight);
		
		let pSwipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(
			target: self, action: #selector(mSwipeHandler(inGestureRecognizer:))
		);
		pSwipeLeft.direction = .left;
		view.addGestureRecognizer(pSwipeLeft);
		
		let pSwipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(
			target: self, action: #selector(mSwipeHandler(inGestureRecognizer:))
		);
		pSwipeUp.direction = .up;
		view.addGestureRecognizer(pSwipeUp);
		
		let pSwipeDown: UISwipeGestureRecognizer = UISwipeGestureRecognizer(
			target: self, action: #selector(mSwipeHandler(inGestureRecognizer:))
		);
		pSwipeDown.direction = .down;
		view.addGestureRecognizer(pSwipeDown);
	}
	
	private func mDefineLabel() -> Void {
		
		pLabelGesture.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 10);
		pLabelGesture.center = view.center;
		pLabelGesture.textAlignment = .center;
		pLabelGesture.text = "Do gesture";
		pLabelGesture.backgroundColor = __COLOR_WHITE;
		
		view.addSubview(pLabelGesture);
	}
}

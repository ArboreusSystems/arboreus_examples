//
//  MainViewController.swift
//  Subscription
//
//  Created by Alexandr Kirilov on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	let pScreenWidth: CGFloat = UIScreen.main.bounds.width;
	let pScreenHeight: CGFloat = UIScreen.main.bounds.height;
	var pSubscriptionView: Optional<UIView> = nil;
	let pSubscription: Subscription = Subscription();

	override func viewDidLoad() {

		super.viewDidLoad();
		mCheckSubscription();
	}

	private func mCheckSubscription() -> Void {

		if (pSubscriptionView == nil) {
			if (pSubscription.pStatus) {
				mSubscribed();
			} else {
				mNotSubscribed();
			}
			self.view.addSubview(pSubscriptionView!);
		}
	}

	private func mNotSubscribed() -> Void {

		let oButton: UIButton = UIButton.init(frame: CGRect.init(
			x: (pScreenWidth - (pScreenWidth * 0.8)) / 2,
			y: pScreenHeight * 0.3,
			width: pScreenWidth * 0.8,
			height: pScreenHeight * 0.15
		));
		oButton.setTitle("Subscribe", for: .normal);
		oButton.addTarget(self, action: #selector(self.pressButton(_:)), for: .touchUpInside)
		oButton.backgroundColor = UIColor.init(
			red: 0.0 / 255.0, green: 82.0 / 255.0, blue: 231.0 / 255.0, alpha: 1
		);
		oButton.setTitleColor(.white, for: .normal);
		pSubscriptionView = oButton;
	}

	private func mSubscribed() -> Void {

		let oLabel: UILabel = UILabel.init(frame: CGRect.init(
			x: (pScreenWidth - (pScreenWidth * 0.8)) / 2,
			y: pScreenHeight * 0.3,
			width: pScreenWidth * 0.8,
			height: pScreenHeight * 0.15
		));
		oLabel.text = "Subscribed";
		oLabel.textAlignment = NSTextAlignment.center;
		pSubscriptionView = oLabel;
	}

	@objc func pressButton(_ sender: UIButton) -> Void {

		if (pSubscription.mSubscribe()) {
			pSubscriptionView?.removeFromSuperview();
			pSubscription.pStatus = true;
			mSubscribed();
			self.view.addSubview(pSubscriptionView!);
		};
	}
	
	@IBAction func mButtonExit(_ sender: Any) {
		
		Handler.mDoExit();
	}
}

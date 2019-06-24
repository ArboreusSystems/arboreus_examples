//
//  SubscriptionViewController.swift
//  Subscription
//
//  Created by Alexandr Kirilov on 2019-06-23.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit
import StoreKit

class SubscriptionViewController: UIViewController, SubscriptionView {

	let pScreenWidth: CGFloat = UIScreen.main.bounds.width;
	let pScreenHeight: CGFloat = UIScreen.main.bounds.height;
	let pElementX: CGFloat = (UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 0.8)) / 2;
	let pElementWidth: CGFloat = UIScreen.main.bounds.width * 0.8;
	var pSubscription: Optional<Subscription> = nil;
	var pSubscriptionView: Optional<UIView> = nil;

	override func viewDidLoad() -> Void {

		super.viewDidLoad();
		self.view.backgroundColor = UIColor.white;
		mButtonExit();
		self.view.addSubview(mLabel(inText: "Swift", inY: 0.1, inHeight: 0.05));
		self.view.addSubview(mLabel(inText: "Auto Renewable Subscription", inY: 0.15, inHeight: 0.1));
		pSubscription = Subscription.mGetInstance;
		pSubscription?.mSetViewController(inViewController: self);
		mLabelInitialising();
		if (pSubscription!.mCheckCanPayments()) {

		}
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

	private func mLabelInitialising() -> Void {

		if (pSubscriptionView != nil) {
			pSubscriptionView?.removeFromSuperview();
		}
		let oLabel = mLabel(inText: "Initialising Subscription", inY: 0.3, inHeight: 0.2);
		oLabel.backgroundColor = UIColor.lightGray;
		oLabel.textColor = UIColor.white;
		pSubscriptionView = oLabel;
		self.view.addSubview(pSubscriptionView!);
	}

	func mViewSubscribe(inSubscriptionProduct: SKProduct) -> Void {

		var oTitle: String = "Subscribe ";
		oTitle += "\(inSubscriptionProduct.price)";
		oTitle += inSubscriptionProduct.priceLocale.currencySymbol!;
		let oButton: UIButton = UIButton(frame: mCreateFrame(inY: 0.3, inHeight: 0.2));
		oButton.setTitle(oTitle, for: .normal);
		oButton.backgroundColor = UIColor.blue;
		oButton.setTitleColor(UIColor.white, for: .normal);
		oButton.addTarget(self, action: #selector(mDoSubscribe(_:)), for: .touchUpInside);
		if (pSubscriptionView != nil) {
			pSubscriptionView?.removeFromSuperview();
		}
		pSubscriptionView = oButton;
		self.view.addSubview(pSubscriptionView!);
	}

	func mViewNotAvailable() -> Void {

		if (pSubscriptionView != nil) {
			pSubscriptionView?.removeFromSuperview();
		}
		pSubscriptionView = mLabel(inText: "Subscription not available", inY: 0.3, inHeight: 0.2);
		self.view.addSubview(pSubscriptionView!);
	}

	func mViewSubscribed() -> Void {

		if (pSubscriptionView != nil) {
			pSubscriptionView?.removeFromSuperview();
		}
		pSubscriptionView = mLabel(inText: "Subscribed", inY: 0.3, inHeight: 0.2);
		pSubscriptionView!.backgroundColor = UIColor.green;
		self.view.addSubview(pSubscriptionView!);
	}

	func mViewInProgress() -> Void {

		if (pSubscriptionView != nil) {
			pSubscriptionView?.removeFromSuperview();
		}
		pSubscriptionView = mLabel(inText: "Subscription in progress", inY: 0.3, inHeight: 0.2);
		pSubscriptionView!.backgroundColor = UIColor.init(
			red: 5.0 / 255.0, green: 129.0 / 255.0, blue: 181.0 / 255.0, alpha: 1
		);
		self.view.addSubview(pSubscriptionView!);
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

		Handler.mDoExit();
	}

	@objc func mDoSubscribe(_ inSender: Any) -> Void {

		if (pSubscription != nil) {
			pSubscription?.mSubscribe();
			mViewInProgress();
		}
	}
}

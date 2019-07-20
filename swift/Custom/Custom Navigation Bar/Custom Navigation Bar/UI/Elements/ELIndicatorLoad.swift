//
//  ELIndicatorLoad.swift
//  Custom Navigation Bar
//
//  Created by Alexandr Kirilov on 19/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class ELIndicatorLoad: UIView {

	let pImageView: UIImageView = UIImageView();
	let pImageName: String = "IndicatorLoad";
	
	override init(frame: CGRect) {
		
		super.init(frame: frame);
		self.mInitialize();
	}
	
	required init?(coder aDecoder: NSCoder) {
	
		super.init(coder: aDecoder);
		self.mInitialize();
	}
	
    private func mInitialize() -> Void {

		self.isHidden = true;
		self.translatesAutoresizingMaskIntoConstraints = false;
		self.pImageView.image = UIImage(named: self.pImageName);
		self.pImageView.frame = self.bounds;
		self.addSubview(pImageView);
	}

	func mStartAnimating() -> Void {

		self.isHidden = false;
		mRotate();
	}

	func mStopAnimating() -> Void {

		self.isHidden = true;
		mRemoveRotation();
	}

	private func mRotate() -> Void {

		let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z");
		rotation.toValue = NSNumber(value: Double.pi * 2);
		rotation.duration = 1;
		rotation.isCumulative = true;
		rotation.repeatCount = Float.greatestFiniteMagnitude;
		self.pImageView.layer.add(rotation, forKey: "rotationAnimation");
	}

	private func mRemoveRotation() -> Void {

		self.pImageView.layer.removeAnimation(forKey: "rotationAnimation");
    }
}

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
	
	init(frame: CGRect, image: UIImage) {
		
		super.init(frame: frame);
		mInitialize(inImage: image);
	}
	
	required init?(coder aDecoder: NSCoder) {
	
		fatalError("init(coder:) has not been implemented");
	}
	
    private func mInitialize(inImage: UIImage) -> Void {
		
		self.pImageView.backgroundColor = _COLOR_PURPLE;
//		self.pImageView.frame = bounds;
		self.pImageView.image = inImage;
		self.pImageView.contentMode = .scaleAspectFit;
		self.pImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight];
		self.addSubview(pImageView);
	}
	
	func mStartAnimating() -> Void {
	
		isHidden = false;
		mRotate();
	}

	func mStopAnimating() -> Void {
		
		isHidden = true;
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

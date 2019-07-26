//
//  CONSwitch.swift
//  Custom UIControl
//
//  Created by Alexandr Kirilov on 24/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class CONSwitch: UIControl {

	var isActive: Bool = false;
	var pImage: UIImageView = UIImageView();
	
	init(inSize: CGFloat) {
	
		super.init(frame: CGRect(x: 0, y: 0, width: inSize, height: inSize));
		self.mInitialize();
	}
	
	override init(frame: CGRect) {
		
		super.init(frame: frame);
		self.mInitialize();
	}
	
	required init?(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder);
		self.mInitialize();
	}
	
	private func mInitialize() -> Void {
	
		self.backgroundColor = _COLOR_GREEN;
		
		self.addTarget(self, action: #selector(mTouchedDown1(_:)), for: .touchDown);
		self.addTarget(self, action: #selector(mTouchedDown2(_:)), for: .touchDown);
		self.addTarget(self, action: #selector(mTouchedUpInside(_:)), for: .touchUpInside);
		self.addTarget(self, action: #selector(mDidDragInsideControl(_:)), for: .touchDragInside);
		
		self.mSetImage();
	}
	
	private func mSetImage() -> Void {
	
		pImage.removeFromSuperview();
		if (isActive) {
			pImage.image = UIImage(named: "switch_yes");
		} else {
			pImage.image = UIImage(named: "switch_no");
		}
		pImage.frame.size = self.bounds.size;
		self.addSubview(pImage);
	}
	
	@objc func mTouchedUpInside(_ inSender: Any) -> Void {

		print("mTouchedUpInside()");
		if (isActive) {
			self.isActive = false;
		} else {
			self.isActive = true;
		}
		self.mSetImage();
	}

	@objc func mDidDragInsideControl(_ inSender: Any) -> Void {

		print("mDidDragInsideControl()");
	}

	@objc func mTouchedDown1(_ inSender: Any) -> Void {

		print("mTouchedDown1()");
	}
	
	@objc private func mTouchedDown2(_ inSender: Any) -> Void {

		print("mTouchedDown2()");
	}
}



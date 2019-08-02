//
//  VCMain.swift
//  UIKit UISegmentControl
//
//  Created by Alexandr Kirilov on 02/08/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCMain: UIViewController {

	let pSCView: UIView = UIView();
	let pSC: UISegmentedControl = UISegmentedControl();
	let pSCLabel: UILabel = UILabel();
	var pSCLabelText: String = "Colored Text";
	let pSCItems: Array<String> = ["Green","Blue","Purple"];
	
	let pLabelLanguage: UILabel = UILabel();
	let pLabelNotice: UILabel = UILabel();
	let pButtonExit: UIButton = UIButton();

	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = _COLOR_WHITE;
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
		
		self.mCreateLabelLanguage();
		self.mCreateLabelNotice();
		self.mCreateButtonExit();
		
		self.mCreateSegmentControl();
	}
	
	private func mCreateSegmentControl() -> Void {
	
		self.view.addSubview(pSCView);
		pSCView.translatesAutoresizingMaskIntoConstraints = false;
		pSCView.backgroundColor = _COLOR_CLEAN_WHITE;
		pSCView.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.8).isActive = true;
		pSCView.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.3).isActive = true;
		pSCView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
		pSCView.centerYAnchor.constraint(
			equalTo: self.view.centerYAnchor,
			constant: -self.view.bounds.height * 0.04
		).isActive = true;
		
		pSCView.addSubview(pSCLabel);
		pSCLabel.translatesAutoresizingMaskIntoConstraints = false;
		pSCLabel.text = pSCLabelText;
		pSCLabel.font = pSCLabel.font.withSize(self.view.bounds.width * 0.1);
		pSCLabel.textColor = _COLOR_PURPLE_DARK;
		pSCLabel.centerXAnchor.constraint(equalTo: pSCView.centerXAnchor).isActive = true;
		pSCLabel.topAnchor.constraint(
			equalTo: pSCView.topAnchor,
			constant: self.view.bounds.height * 0.03
		).isActive = true;
		
		pSCView.addSubview(pSC);
		for iSegmet in pSCItems {
			pSC.insertSegment(withTitle: iSegmet, at: pSC.numberOfSegments, animated: true);
		}
		pSC.translatesAutoresizingMaskIntoConstraints = false;
		pSC.centerXAnchor.constraint(equalTo: pSCView.centerXAnchor).isActive = true;
		pSC.bottomAnchor.constraint(
			equalTo: pSCView.bottomAnchor,
			constant: -self.view.bounds.height * 0.04
		).isActive = true;
		pSC.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.65).isActive = true;
		pSC.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.06).isActive = true;
		pSC.addTarget(self, action: #selector(mDoSegmentControlChange(inSender:)), for: .valueChanged);
	}
	
	private func mCreateLabelLanguage() -> Void {

		pLabelLanguage.text = "Swift examples";
		self.view.addSubview(pLabelLanguage);
		pLabelLanguage.translatesAutoresizingMaskIntoConstraints = false;
		pLabelLanguage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true;
		pLabelLanguage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
	}

	private func mCreateLabelNotice() -> Void {

		pLabelNotice.text = "UISegmentControl Example";
		self.view.addSubview(pLabelNotice);
		pLabelNotice.translatesAutoresizingMaskIntoConstraints = false;
		pLabelNotice.topAnchor.constraint(equalTo: self.pLabelLanguage.bottomAnchor, constant: 20).isActive = true;
		pLabelNotice.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
	}

	private func mCreateButtonExit() -> Void {

		self.view.addSubview(pButtonExit);
		pButtonExit.translatesAutoresizingMaskIntoConstraints = false;
		pButtonExit.backgroundColor = _COLOR_BLUE_DARK;
		pButtonExit.setTitleColor(.white, for: .normal);
		pButtonExit.setTitle("Exit", for: .normal);
		pButtonExit.addTarget(self, action: #selector(mDoExit), for: .touchUpInside);
		pButtonExit.centerXAnchor.constraint(
			equalTo: self.view.centerXAnchor
		).isActive = true;
		pButtonExit.bottomAnchor.constraint(
			equalTo: self.view.bottomAnchor,
			constant: -self.view.bounds.height * 0.06
		).isActive = true;
		pButtonExit.widthAnchor.constraint(
			equalTo: self.view.widthAnchor,
			constant: -self.view.bounds.width * 0.2
		).isActive = true;
		pButtonExit.heightAnchor.constraint(
			equalTo: self.view.heightAnchor,
			constant: -self.view.bounds.height * 0.93
		).isActive = true;
	}
	
	@objc private func mDoSegmentControlChange(inSender: UISegmentedControl) -> Void {
	
		if (inSender == pSC) {
			switch pSC.selectedSegmentIndex {
				case 0: pSCLabel.textColor = _COLOR_GREEN_DARK;
				case 1: pSCLabel.textColor = _COLOR_BLUE_DARK;
				default: pSCLabel.textColor = _COLOR_PURPLE_DARK;
			}
		}
	}
	
	@objc private func mDoExit() -> Void {

	   	HMain.mDoExit();
	}
}

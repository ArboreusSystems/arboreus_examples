//
//  VCSwitch.swift
//  UIKit UISwitch
//
//  Created by Alexandr Kirilov on 23/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCSwitch: UIViewController {

	let pLBLLanguage: UILabel = UILabel();
	let pLBLNotice: UILabel = UILabel();
	let pButtonExit: UIButton = UIButton();
	
	let pSwitchDefault: UISwitch = UISwitch();
	let pSwitchSemiDefault: UISwitch = UISwitch();

	override func loadView() {
		
		super.loadView();
		
		self.view.translatesAutoresizingMaskIntoConstraints = false;
		self.view.backgroundColor = _COLOR_WHITE;
		
		self.view.addSubview(pLBLLanguage);
		self.view.addSubview(pLBLNotice);
		self.view.addSubview(pButtonExit);
		
		self.view.addSubview(pSwitchDefault);
		self.view.addSubview(pSwitchSemiDefault);
	}
	
	override func viewDidLayoutSubviews() {
		
		super.viewDidLayoutSubviews();
		
		pLBLLanguage.text = "Swift Examples";
		pLBLLanguage.sizeThatFits(CGSize(
			width: self.view.bounds.width * 0.8,
			height: self.view.bounds.height * 0.05
		));
		pLBLLanguage.translatesAutoresizingMaskIntoConstraints = false;
		pLBLLanguage.centerXAnchor.constraint(
			equalTo: self.view.centerXAnchor
		).isActive = true;
		pLBLLanguage.topAnchor.constraint(
			equalTo: self.view.topAnchor,
			constant: self.view.bounds.height * 0.05
		).isActive = true;
		
		pLBLNotice.text = "UISwitch examples";
		pLBLNotice.sizeThatFits(CGSize(
			width: self.view.bounds.width * 0.8,
			height: self.view.bounds.height * 0.05
		));
		pLBLNotice.translatesAutoresizingMaskIntoConstraints = false;
		pLBLNotice.centerXAnchor.constraint(
			equalTo: self.view.centerXAnchor
		).isActive = true;
		pLBLNotice.topAnchor.constraint(
			equalTo: pLBLLanguage.bottomAnchor,
			constant: self.view.bounds.height * 0.02
		).isActive = true;
		
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
		
		self.mDefineSwitchDefault();
		self.mDefineSwitchSemiDefult();
	}
	
	private func mDefineSwitchDefault() -> Void {
		
		pSwitchDefault.setOn(true, animated: true);
		pSwitchDefault.addTarget(self, action: #selector(mDoSwitchDefault(inSwitch:)), for: .valueChanged);
		pSwitchDefault.translatesAutoresizingMaskIntoConstraints = false;
		pSwitchDefault.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
		pSwitchDefault.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true;
	}
	
	private func mDefineSwitchSemiDefult() -> Void {
		
		pSwitchSemiDefault.translatesAutoresizingMaskIntoConstraints = false;
		pSwitchSemiDefault.centerXAnchor.constraint(
			equalTo: self.view.centerXAnchor
		).isActive = true;
		pSwitchSemiDefault.bottomAnchor.constraint(
			equalTo: pSwitchDefault.bottomAnchor,
			constant: -self.view.bounds.height * 0.1
		).isActive = true;
		pSwitchSemiDefault.tintColor = _COLOR_BLUE;
		pSwitchSemiDefault.onTintColor = _COLOR_PURPLE;
		pSwitchSemiDefault.thumbTintColor = _COLOR_CLEAN_WHITE;
		pSwitchSemiDefault.addTarget(
			self, action: #selector(mDoSwitchSemiDefault(inSwitch:)), for: .valueChanged
		);
	}
	
	@objc private func mDoSwitchDefault(inSwitch: UISwitch) -> Void {
		
		print("pSwitchDefault: run target function");
		if (inSwitch.isOn) {
			print("mDoSwitchDefault() -> detected on");
		} else {
			print("mDoSwitchDefault() -> detected off");
		}
	}
	
	@objc private func mDoSwitchSemiDefault(inSwitch: UISwitch) -> Void {
	
		print("mDoSwitchSemiDefault: run target function");
		if (inSwitch.isOn) {
			print("mDoSwitchSemiDefault() -> detected on");
		} else {
			print("mDoSwitchSemiDefault() -> detected off");
		}
	}
	
	@objc private func mDoExit() -> Void {
	
		MainHandler.mDoExit();
	}
}

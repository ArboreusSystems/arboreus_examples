//
//  VCMain.swift
//  UIKit UIActivityViewController
//
//  Created by Alexandr Kirilov on 06/08/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCMain: UIViewController, UITextFieldDelegate {

	let pActivityView: UIView = UIView();
	var pButtonShare: UIButton = UIButton();
	var pTextField: UITextField = UITextField();
	var pUIActivityViewController: Optional<UIActivityViewController> = nil;

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
		
		self.mCreateActivity();
	}
	
	private func mCreateActivity() -> Void {
	
		self.view.addSubview(pActivityView);
		pActivityView.backgroundColor = _COLOR_CLEAN_WHITE;
		pActivityView.translatesAutoresizingMaskIntoConstraints = false;
		pActivityView.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.9).isActive = true;
		pActivityView.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.2).isActive = true;
		pActivityView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
		pActivityView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20.0).isActive = true;
		
		pActivityView.addSubview(pTextField);
		pTextField.translatesAutoresizingMaskIntoConstraints = false;
		pTextField.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.8).isActive = true;
		pTextField.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.06).isActive = true;
		pTextField.centerXAnchor.constraint(equalTo: pActivityView.centerXAnchor).isActive = true;
		pTextField.topAnchor.constraint(equalTo: pActivityView.topAnchor, constant: self.view.bounds.height * 0.03).isActive = true;
		pTextField.layer.borderColor = _COLOR_BLUE_DARK.cgColor;
		pTextField.layer.borderWidth = 1.0;
		pTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.height * 0.03 * 0.55, height: self.view.bounds.height * 0.03));
		pTextField.leftViewMode = UITextField.ViewMode.always;
		pTextField.placeholder = "Enter text for sharing";
		pTextField.delegate = self;
		
		pActivityView.addSubview(pButtonShare);
		pButtonShare.backgroundColor = _COLOR_PURPLE_DARK;
		pButtonShare.setTitleColor(.white, for: .normal);
		pButtonShare.setTitle("Share", for: .normal);
		pButtonShare.translatesAutoresizingMaskIntoConstraints = false;
		pButtonShare.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.8).isActive = true;
		pButtonShare.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.06).isActive = true;
		pButtonShare.centerXAnchor.constraint(equalTo: pActivityView.centerXAnchor).isActive = true;
		pButtonShare.topAnchor.constraint(equalTo: pTextField.bottomAnchor, constant: self.view.bounds.height * 0.03 * 0.7).isActive = true;
		pButtonShare.addTarget(self, action: #selector(mDoShare), for: .touchUpInside);
	}
	
	private func mCreateTextField() -> Void {
		
		pTextField.frame = CGRect(x: 0, y: 0, width: 250, height: 30);
		pTextField.backgroundColor = _COLOR_CLEAN_WHITE;
		pTextField.layer.borderColor = _COLOR_BLUE_DARK.cgColor;
		pTextField.layer.borderWidth = 1.0;
		pTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: pTextField.frame.height));
		pTextField.leftViewMode = UITextField.ViewMode.always;
		pTextField.placeholder = "Enter text for sharing";
		pTextField.center = self.view.center;
		self.view.addSubview(pTextField);
	}
	
	private func mCreateLabelLanguage() -> Void {

		pLabelLanguage.text = "Swift examples";
		self.view.addSubview(pLabelLanguage);
		pLabelLanguage.translatesAutoresizingMaskIntoConstraints = false;
		pLabelLanguage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true;
		pLabelLanguage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
	}

	private func mCreateLabelNotice() -> Void {

		pLabelNotice.text = "UIActivityViewController Example";
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
	
	@objc private func mDoExit() -> Void {

	   	HMain.mDoExit();
	}
	
	@objc private func mDoShare(inObject: Any) -> Void {
		
		let oText: Optional<String> = pTextField.text;
		if (oText!.count != 0) {
			pUIActivityViewController = UIActivityViewController(activityItems: [oText ?? "nothing to send"], applicationActivities: nil);
			self.present(pUIActivityViewController!, animated: true, completion: nil);
		}
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		pTextField.resignFirstResponder();
		return true;
	}
}

//
//  VCMain.swift
//  UIKit UIPicker
//
//  Created by Alexandr Kirilov on 31/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCMain: UIViewController {

	let pPicker: UIPickerView = UIPickerView();
	let pLabelLanguage: UILabel = UILabel();
	let pLabelNotice: UILabel = UILabel();
	let pButtonExit: UIButton = UIButton();

	override func loadView() {
		
		super.loadView();
		self.view.backgroundColor = _COLOR_WHITE;
	}

	override func viewDidLoad() {

		super.viewDidLoad();

		pPicker.center = self.view.center;
		pPicker.dataSource = self;
		pPicker.delegate = self;
		self.view.addSubview(pPicker);

		self.mCreateLabelLanguage();
		self.mCreateLabelNotice();
		self.mCreateButtonExit();
	}

	private func mCreateLabelLanguage() -> Void {

		pLabelLanguage.text = "Swift examples";
		self.view.addSubview(pLabelLanguage);
		pLabelLanguage.translatesAutoresizingMaskIntoConstraints = false;
		pLabelLanguage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true;
		pLabelLanguage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
	}

	private func mCreateLabelNotice() -> Void {

		pLabelNotice.text = "UIPickerView Example";
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
}

extension VCMain: UIPickerViewDataSource {

	public func numberOfComponents(in pickerView: UIPickerView) -> Int {

		return 3;
	}

	public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

		return 10;
	}
}

extension VCMain: UIPickerViewDelegate {

	public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

		let oResult: String = "Row:\(row)";
		return oResult;
	}
}

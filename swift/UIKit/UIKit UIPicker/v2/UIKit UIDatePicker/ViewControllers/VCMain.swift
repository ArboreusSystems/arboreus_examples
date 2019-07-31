//
//  VCMain.swift
//  UIKit UIDatePicker
//
//  Created by Alexandr Kirilov on 31/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCMain: UIViewController {

	let pDatePicker: UIDatePicker = UIDatePicker();
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
		
		let oTimeYear: TimeInterval = 365 * 24 * 60 * 60;
		let oTimeToday: Date = Date();
		
		pDatePicker.minimumDate = oTimeToday.addingTimeInterval(oTimeYear);
		pDatePicker.maximumDate = oTimeToday.addingTimeInterval(2 * oTimeYear);
		pDatePicker.center = self.view.center;
		pDatePicker.datePickerMode = .date;
		self.view.addSubview(pDatePicker);
		pDatePicker.addTarget(self, action: #selector(mDoValueChanged), for: .valueChanged);
	}
	
	@objc private func mDoValueChanged() -> Void {
		
		print("UIDatePicker -> mDoValueChanged(): \(pDatePicker.date)");
	}
	
	private func mCreateLabelLanguage() -> Void {

		pLabelLanguage.text = "Swift examples";
		self.view.addSubview(pLabelLanguage);
		pLabelLanguage.translatesAutoresizingMaskIntoConstraints = false;
		pLabelLanguage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true;
		pLabelLanguage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
	}

	private func mCreateLabelNotice() -> Void {

		pLabelNotice.text = "UIDatePicker Example";
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

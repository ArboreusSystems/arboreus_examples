//
//  DemoTableViewCell.swift
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 01/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
	
	var pTextName: String = "Default Name";
	var pTextType: String = "Default Type";
	static let pReuseID: String = "DemoTableViewCell";
	
	private let pLabelName: UILabel = UILabel();
	private let pLabelType: UILabel = UILabel();
	
	// MARK: Lyfecycle
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		
		super.init(style: style, reuseIdentifier: reuseIdentifier);
		
		backgroundColor = __COLOR_BLUE_DARK;
		textLabel?.textColor = __COLOR_WHITE;
		
		mSetupLabelName();
		mSetupLabeltype();
		
		addSubview(pLabelName);
		addSubview(pLabelType);
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented");
	}
	
	// MARK: UI Components
	
	private func mSetupLabelName() -> Void {
		
		pLabelName.translatesAutoresizingMaskIntoConstraints = false;
		pLabelName.text = pTextName;
	}
	
	private func mSetupLabeltype() -> Void {
		
		pLabelType.translatesAutoresizingMaskIntoConstraints = false;
		pLabelType.text = pTextType;
	}
}

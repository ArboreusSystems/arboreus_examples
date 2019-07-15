//
//  PRContentView.swift
//  Custom Navigation
//
//  Created by Alexandr Kirilov on 2019-07-15.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class PRContentView: UIViewController {

	var pMainView: Optional<VCMain> = nil;

	override func loadView() {

		super.loadView();
		self.view.translatesAutoresizingMaskIntoConstraints = false;
	}
}

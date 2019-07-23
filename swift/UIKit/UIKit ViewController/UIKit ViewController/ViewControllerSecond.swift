//
//  ViewControllerSecond.swift
//  UIKit ViewController
//
//  Created by Alexandr Kirilov on 23/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class ViewControllerSecond: UIViewController {

	convenience init() {
		
		print("ViewControllerSecond.init()\nBefore super action");
		self.init();
	}
	
	required init?(coder aDecoder: NSCoder) {
		
		print("ViewControllerSecond.init?(coder aDecoder: NSCoder)");
		super.init(coder: aDecoder);
	}
	
	override func loadView() {
		
		print("ViewControllerSecond.loadView()");
		super.loadView();
	}
	
    override func viewDidLoad() {
		
		print("ViewControllerSecond.viewDidLoad()");
        super.viewDidLoad();
    }
	
    override func viewWillAppear(_ animated: Bool) {
		
		print("ViewControllerSecond.viewWillAppear(_ animated: Bool)");
        super.viewWillAppear(animated);
	}
	
    override func viewDidAppear(_ animated: Bool) {
	
		print("ViewControllerSecond.viewDidAppear(_ animated: Bool)");
        super.viewDidAppear(animated);
	}
	
	override func viewDidLayoutSubviews() {
		
		print("ViewControllerSecond.viewDidLayoutSubviews()");
        super.viewDidLayoutSubviews();
	}
	
	private func mCheckFrame() {
	
		let oWidth: CGFloat = self.view.frame.width;
		let oHeight: CGFloat = self.view.frame.height;
		print("Frame -> Width: \(oWidth), Height: \(oHeight)");
	}
	
	private func mCheckBounds() {
	
		let oWidth: CGFloat = self.view.bounds.width;
		let oHeight: CGFloat = self.view.bounds.height;
		print("Frame -> Width: \(oWidth), Height: \(oHeight)");
	}
}

//
//  MainViewController.swift
//  UIKit UINavigationContolller
//
//  Created by Alexandr Kirilov on 19/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	private var pButtonExit: Optional<UIButton> = nil;
	private var pItemButtonExit: Optional<UIBarButtonItem> = nil;
	private var pButtonMenu: Optional<UIButton> = nil;
	private var pItemButtonMenu: Optional<UIBarButtonItem> = nil;

	override func loadView() {
		
		super.loadView();
		title = "Main";
	}
	
    override func viewDidLoad() {
		
		super.viewDidLoad();
		view.backgroundColor = __COLOR_WHITE;
		
		mSetupButtonExit();
		navigationItem.leftBarButtonItems = [pItemButtonExit!];
		
		mSetupButtonMenu();
		navigationItem.rightBarButtonItems = [pItemButtonMenu!];
    }
	
	// MARK: UI Actions
	
	@objc func mActionButtonExit() -> Void {
		
		LogHandler.mMessage("Button Exit pressed", inClass: String(describing: self));
		ApplicationHandler.mDoExit();
	}
	
	@objc func mActionButtonMenu() -> Void {
		
		LogHandler.mMessage("Button Menu pressed", inClass: String(describing: self));
		navigationController?.pushViewController(MenuViewController(), animated: true);
	}
	
	// MARK: UI Components
	
	private func mSetupButtonMenu() -> Void {
		
		pButtonMenu = UIButton(type: .custom);
		pButtonMenu?.setBackgroundImage(UIImage(named: "ButtonHumburger_normal"), for: .normal);
		pButtonMenu?.setBackgroundImage(UIImage(named: "ButtonHumburger_onClick"), for: .focused);
		pButtonMenu?.addTarget(self, action: #selector(mActionButtonMenu), for: .touchUpInside);
		
		pItemButtonMenu = UIBarButtonItem(customView: pButtonMenu!);
		pItemButtonMenu?.customView?.translatesAutoresizingMaskIntoConstraints = false;
		pItemButtonMenu?.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true;
		pItemButtonMenu?.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true;
	}
	
	private func mSetupButtonExit() -> Void {
		
		pButtonExit = UIButton(type: .custom);
		pButtonExit?.setBackgroundImage(UIImage(named: "ButtonExit_normal"), for: .normal);
		pButtonExit?.setBackgroundImage(UIImage(named: "ButtonExit_onClick"), for: .focused);
		pButtonExit?.addTarget(self, action: #selector(mActionButtonExit), for: .touchUpInside);
		
		pItemButtonExit = UIBarButtonItem(customView: pButtonExit!);
		pItemButtonExit?.customView?.translatesAutoresizingMaskIntoConstraints = false;
		pItemButtonExit?.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true;
		pItemButtonExit?.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true;
	}
}

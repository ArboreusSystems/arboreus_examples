//
//  LoginViewController.swift
//  UIKit UINavigationContolller
//
//  Created by Alexandr Kirilov on 19/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	
	private var pButtonLogin: UIButton = UIButton();
	
	override func loadView() -> Void {
		
		super.loadView();
		title = "Login";
		
		navigationController?.navigationBar.isHidden = true;
	}

    override func viewDidLoad() -> Void {
	
		super.viewDidLoad();
		view.backgroundColor = __COLOR_WHITE;
		
		mSetupButtonLogin();
    }
	
	// MARK: UI Actions
	
	@objc func mActionButtonLogin() -> Void {
		
		LogHandler.mMessage("Button Login pressed", inClass: String(describing: self));
		navigationController?.setViewControllers([MainViewController()], animated: true);
		navigationController?.navigationBar.isHidden = false;
	}
	
	// MARK: UI Components
	
	private func mSetupButtonLogin() -> Void {
		
		pButtonLogin.frame = CGRect(x: 0,y: 0,width: 100,height: 30);
		pButtonLogin.backgroundColor = __COLOR_BLUE_DARK;
		pButtonLogin.setTitleColor(__COLOR_WHITE, for: .normal);
		pButtonLogin.setTitle("Login", for: .normal);
		pButtonLogin.addTarget(self, action: #selector(mActionButtonLogin), for: .touchUpInside);
		view.addSubview(pButtonLogin);
		pButtonLogin.translatesAutoresizingMaskIntoConstraints = false;
		pButtonLogin.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.7).isActive = true;
		pButtonLogin.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.2).isActive = true;
		pButtonLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
		pButtonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
	}
}

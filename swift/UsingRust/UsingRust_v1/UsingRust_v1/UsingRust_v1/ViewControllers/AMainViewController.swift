//
//  AMainViewController.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import UIKit

class AMainViewController: AViewControllerTemplate {
	
	var pButton: AButtonTemplate = AButtonTemplate();
    var pLabel: UILabel = UILabel();
	
	override func loadView() {
		
		super.loadView();
		self.title = "UsingRust_v1";
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
        
        pButton.setTitle("Get from Rust", for: .normal);
        pButton.addTarget(self, action: #selector(mActionGetDataFromRustLibrary(inSender:)), for: .touchUpInside);
        pViewContent.addSubview(pButton);
        pButton.topAnchor.constraint(equalTo: pViewContent.topAnchor).isActive = true;
        pButton.heightAnchor.constraint(equalToConstant: 80.0).isActive = true;
        pButton.leftAnchor.constraint(equalTo: pViewContent.leftAnchor).isActive = true;
        pButton.rightAnchor.constraint(equalTo: pViewContent.rightAnchor).isActive = true;
        
        pLabel.text = "No data from Rust";
        pLabel.textColor = __COLOR_WHITE;
        pLabel.font = UIFont.systemFont(ofSize: 20.0);
        pLabel.translatesAutoresizingMaskIntoConstraints = false;
        pLabel.textAlignment = .center;
        pViewContent.addSubview(pLabel);
        pLabel.centerYAnchor.constraint(equalTo: pViewContent.centerYAnchor, constant: -40.0).isActive = true;
        pLabel.heightAnchor.constraint(equalToConstant: 80.0).isActive = true;
        pLabel.leftAnchor.constraint(equalTo: pViewContent.leftAnchor).isActive = true;
        pLabel.rightAnchor.constraint(equalTo: pViewContent.rightAnchor).isActive = true;
	}
    
    // -----------------------------------
    // MARK: Actions
    
    @objc func mActionGetDataFromRustLibrary(inSender:Any) -> Void {
        
        __ALog("mActionGetDataFromRustLibrary");
        
        let oData: String = String(cString: fStringFromRustLibrary());
        pLabel.text = oData;
    }
}



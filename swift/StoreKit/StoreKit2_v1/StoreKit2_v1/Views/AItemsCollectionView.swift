//
//  AItemsCollectionView.swift
//  StoreKit2_v1
//
//  Created by Alexandr Kirilov on 19/12/2022.
//

import UIKit

class AItemsCollectionView: UIView, UITableViewDelegate, UITableViewDataSource {
	
	
	// -----------------------------------
	// MARK: Variables
	
	let pButtonGetBroducts: AButtonTemplate = AButtonTemplate();
	let pTableView: UITableView = UITableView(frame: CGRect(x: 0,y: 0,width: 0,height: 0), style: UITableView.Style.plain);
	
	
	// -----------------------------------
	// MARK: Init
	
	override init(frame: CGRect) {
		
		super.init(frame: frame);
		self.backgroundColor = __COLOR_GREEN;
		self.translatesAutoresizingMaskIntoConstraints = false;
		
		pButtonGetBroducts.setTitle("Get products", for: UIControl.State.normal);
		pButtonGetBroducts.addTarget(self, action: #selector(mActionGetProducts(_:)), for: UIControl.Event.touchUpInside);
		self.addSubview(pButtonGetBroducts);
		
		pTableView.translatesAutoresizingMaskIntoConstraints = false;
		pTableView.delegate = self;
		pTableView.dataSource = self;
		self.addSubview(pTableView);
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		
		super.layoutSubviews();
		
		pButtonGetBroducts.removeConstraints(pButtonGetBroducts.constraints);
		pButtonGetBroducts.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
		pButtonGetBroducts.heightAnchor.constraint(equalToConstant: 80.0).isActive = true;
		pButtonGetBroducts.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
		pButtonGetBroducts.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
		
		pTableView.removeConstraints(pTableView.constraints);
		pTableView.topAnchor.constraint(equalTo: pButtonGetBroducts.bottomAnchor).isActive = true;
		pTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true;
		pTableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
		pTableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
	}
	
	
	// -----------------------------------
	// MARK: Actions
	
	@objc func mActionGetProducts(_ sender: AnyObject) -> Void {

		__ALog("mActionGetProducts");
	}
	
	
	// -----------------------------------
	// MARK: UITableViewDelegate
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 50;
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return 5;
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let oCell: UITableViewCell = UITableViewCell(frame: CGRect(x: 0,y: 0,width: 0,height: 0));
		oCell.backgroundColor = __COLOR_LEMON;

		return oCell;
	}
}

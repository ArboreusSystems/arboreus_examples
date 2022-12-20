//
//  AAsyncAwait.swift
//  AsyncAwait_v1
//
//  Created by Alexandr Kirilov on 20/12/2022.
//

import UIKit

class AAsyncAwait: UIView, UITableViewDelegate, UITableViewDataSource {

	let pURL: Optional<URL> = URL(string:"https://jsonplaceholder.typicode.com/users");
	private var pUsers: Array<AUser> = [AUser]();
	private let pTableView: UITableView = UITableView();
	
	override init(frame: CGRect) {
		
		super.init(frame: frame);
		
		self.translatesAutoresizingMaskIntoConstraints = false;
		
		pTableView.delegate = self;
		pTableView.dataSource = self;
		pTableView.translatesAutoresizingMaskIntoConstraints = false;
		pTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
		self.addSubview(pTableView);
	}
	
	required init?(coder: NSCoder) {
	
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		
		super.layoutSubviews();
		
		pTableView.removeConstraints(pTableView.constraints);
		pTableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
		pTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true;
		pTableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
		pTableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return pUsers.count;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let oCell = pTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
		
		var oContent = oCell.defaultContentConfiguration();
		oContent.text = pUsers[indexPath.row].name;
		oCell.contentConfiguration = oContent;
		
		return oCell;
	}
	
	func mFetchUsers() async -> [AUser] {
		
		__ALog("Fetching users.");
		
		guard let oURL = pURL else { return []; }
		
		do {
			let (oData,_) = try await URLSession.shared.data(from: oURL);
			let oUsers = try JSONDecoder().decode([AUser].self, from: oData);
			__ALog("Users data fetched.");
			return oUsers;
		} catch {
			__ALog("ERROR! Fetching users failed.");
			return [];
		}
	}
	
	func mReloadData(inData:[AUser]) -> Void {
		
		pUsers = inData;
		pTableView.reloadData();
	}
}

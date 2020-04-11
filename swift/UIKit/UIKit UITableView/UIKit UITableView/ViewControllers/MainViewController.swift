//
//  MainViewController.swift
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 01/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	let pSearchBar: UISearchBar = UISearchBar();
	let pTableView: UITableView = UITableView();
	
	let pData: [DemoObject] = [
		DemoObject.init(inName: "Demo Object 1 Name", inTypeData: DemoType.Type1),
		DemoObject.init(inName: "Demo Object 2 Name", inTypeData: DemoType.Type2),
		DemoObject.init(inName: "Demo Object 3 Name", inTypeData: DemoType.Type2),
		DemoObject.init(inName: "Demo Object 4 Name", inTypeData: DemoType.Type3),
		DemoObject.init(inName: "Demo Object 5 Name", inTypeData: DemoType.Type1),
		DemoObject.init(inName: "Demo Object 6 Name", inTypeData: DemoType.Type1),
		DemoObject.init(inName: "Demo Object 7 Name", inTypeData: DemoType.Type3),
		DemoObject.init(inName: "Demo Object 8 Name", inTypeData: DemoType.Type2),
	];
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		
		return .lightContent;
	}

	// MARK: Lifecycle
	
	override func loadView() {
		
		super.loadView();
		
	}
	
    override func viewDidLoad() {
		
		super.viewDidLoad();
		view.backgroundColor = __COLOR_BLUE_DARK;
		
		mSetupSearchBar();
		mSetupTableView();
		
		if #available(iOS 11.0, *) {
			pSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
			pSearchBar.heightAnchor.constraint(equalToConstant: 62.0).isActive = true;
		} else {
			pSearchBar.topAnchor.constraint(equalTo: view.topAnchor,constant: UIApplication.shared.statusBarFrame.size.height).isActive = true;
			pSearchBar.heightAnchor.constraint(equalToConstant: 55.0).isActive = true;
		};
		pSearchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true;
		pSearchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true;
		
		pTableView.topAnchor.constraint(equalTo: pSearchBar.bottomAnchor).isActive = true;
		pTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true;
		pTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true;
		if #available(iOS 11.0, *) {
			pTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		} else {
			pTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true;
		};
    }
	
	// MARK: UI Components
	
	private func mSetupSearchBar() -> Void {
		
		LogHandler.mMessage("mSetupSearchBar", inClass: String(describing: self));
		
		view.addSubview(pSearchBar);
		pSearchBar.translatesAutoresizingMaskIntoConstraints = false;
		pSearchBar.delegate = self;
		pSearchBar.searchBarStyle = .prominent;
		pSearchBar.barTintColor = __COLOR_BLUE;
		pSearchBar.tintColor = __COLOR_WHITE;
		pSearchBar.placeholder = "Name for search";
		if #available(iOS 13, *) {
			pSearchBar.searchTextField.backgroundColor = __COLOR_WHITE;
		}
		UITextField.appearance(whenContainedInInstancesOf: [type(of: pSearchBar)]).tintColor = __COLOR_BLACK;
	}
	
	private func mSetupTableView() -> Void {
		
		LogHandler.mMessage("mSetupTableView", inClass: String(describing: self));
		
		view.addSubview(pTableView);
		pTableView.translatesAutoresizingMaskIntoConstraints = false;
		pTableView.dataSource = self;
		pTableView.delegate = self;
		pTableView.register(DemoTableViewCell.self, forCellReuseIdentifier: DemoTableViewCell.pReuseID);
		pTableView.rowHeight = UITableView.automaticDimension;
		pTableView.estimatedRowHeight = 50;
		pTableView.separatorStyle = .none;
	}
}

// MARK: UISearchBarDelegate

extension MainViewController: UISearchBarDelegate {
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) -> Void {
		
		LogHandler.mMessage("searchBarCancelButtonClicked", inClass: String(describing: self));
		pSearchBar.showsCancelButton = false;
		pSearchBar.text = "";
		pSearchBar.resignFirstResponder();
	}
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		
		LogHandler.mMessage("searchBarTextDidBeginEditing", inClass: String(describing: self));
		pSearchBar.showsCancelButton = true;
	}
	
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		
		print("searchBarTextDidEndEditing");
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		
		LogHandler.mMessage("textDidChange", inClass: String(describing: self));
		if (!pSearchBar.showsCancelButton) {
			pSearchBar.showsCancelButton = true;
		}
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		
		LogHandler.mMessage("searchBarSearchButtonClicked", inClass: String(describing: self));
	}
}

// MARK: UITableViewDataSource

extension MainViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		LogHandler.mMessage("numberOfRowsInSection: \(pData.count)", inClass: String(describing: self));
		return pData.count;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let oCell = pTableView.dequeueReusableCell(withIdentifier: DemoTableViewCell.pReuseID, for: indexPath);
//		let oCell: DemoTableViewCell = DemoTableViewCell();
		let oData: DemoObject = pData[indexPath.row];
		oCell.textLabel?.text = oData.Name;
		return oCell;
	}
}

// MARK: UITableViewDelegate

extension MainViewController: UITableViewDelegate {
	
}

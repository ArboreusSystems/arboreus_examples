//
//  MainViewController.swift
//  UIKit UISearchController
//
//  Created by Alexandr Kirilov on 30/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UISearchBarDelegate {
	
	let pSearchBar: UISearchBar = UISearchBar();

	// MARK: Lifecycle

	override func loadView() -> Void {
		
		super.loadView();
		title = "Main";
	}
	
    override func viewDidLoad() -> Void {

		super.viewDidLoad();
		self.view.backgroundColor = __COLOR_WHITE;
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			barButtonSystemItem: .search, target: self, action: #selector(mActionSearchButton)
		);
		
		pSearchBar.sizeToFit();
		pSearchBar.delegate = self;
		if #available(iOS 13, *) {
			pSearchBar.searchTextField.backgroundColor = __COLOR_WHITE;
		}
		UITextField.appearance(whenContainedInInstancesOf: [type(of: pSearchBar)]).tintColor = __COLOR_BLACK;
	}
	
	// MARK: UISearchBarDelegate
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) -> Void {
		
		print("SearchBar cancel button clicked");
		mSearchBar(inIsShow: false);
	}
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		
		print("searchBarTextDidBeginEditing");
	}
	
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		
		print("searchBarTextDidEndEditing");
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		
		print("textDidChange: \(searchText)");
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		
		print("searchBarSearchButtonClicked");
		pSearchBar.resignFirstResponder();
		mSearchBar(inIsShow: false);
	}
	
	// MARK: UI Elements
	
	func mShowSearchBarButton(inIsShow: Bool) -> Void {
		
		if (inIsShow) {
			navigationItem.rightBarButtonItem = UIBarButtonItem(
				barButtonSystemItem: .search, target: self, action: #selector(mActionSearchButton)
			);
		} else {
			navigationItem.rightBarButtonItem = nil;
		}
	}
	
	func mSearchBar(inIsShow: Bool) -> Void {
		
		mShowSearchBarButton(inIsShow: !inIsShow);
		pSearchBar.showsCancelButton = inIsShow;
		navigationItem.titleView = inIsShow ? pSearchBar : nil;
	}
	
	// MARK: UI Actions
	
	@objc func mActionSearchButton() -> Void {
		
		print("Search button pressed");
		mSearchBar(inIsShow: true);
		pSearchBar.becomeFirstResponder();
	}
}

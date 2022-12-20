//
//  AMainViewController.swift
//  AsyncAwait_v1
//
//  Created by Alexandr Kirilov on 20/12/2022.
//

import UIKit



class AMainViewController: AViewControllerTemplate {
	
	let pAsyncAwaitView: AAsyncAwait = AAsyncAwait();
	
	override func loadView() {
		
		super.loadView();
		self.title = "AsyncAwait v1";
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad();
		
		pViewContent.addSubview(pAsyncAwaitView);
		pAsyncAwaitView.topAnchor.constraint(equalTo: pViewContent.topAnchor).isActive = true;
		pAsyncAwaitView.bottomAnchor.constraint(equalTo: pViewContent.bottomAnchor).isActive = true;
		pAsyncAwaitView.leftAnchor.constraint(equalTo: pViewContent.leftAnchor).isActive = true;
		pAsyncAwaitView.rightAnchor.constraint(equalTo: pViewContent.rightAnchor).isActive = true;
		
		Task { [weak self] in
			let oUsers = await pAsyncAwaitView.mFetchUsers();
			DispatchQueue.main.async {
				self?.pAsyncAwaitView.mReloadData(inData: oUsers);
			}
		}
	}
}

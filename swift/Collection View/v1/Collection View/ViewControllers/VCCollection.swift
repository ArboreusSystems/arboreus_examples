//
//  VCCollection.swift
//  Collection View
//
//  Created by Alexandr Kirilov on 19/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class VCCollection: UICollectionViewController, UICollectionViewDelegateFlowLayout {

	override func loadView() -> Void {
		
		super.loadView();
		navigationItem.title = "Collection View";
		navigationItem.leftBarButtonItem = UIBarButtonItem.init(
			title: "Exit", style: .plain, target: self, action: #selector(mDoExit)
		);
		collectionView.backgroundColor = _COLOR_WHITE;
		collectionView.register(
			ELCollectionCell.self,
			forCellWithReuseIdentifier: _COLLECTION_CELL_ID
		);
	}

    override func viewDidLoad() -> Void {
		
    	super.viewDidLoad();
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
	
		return 50;
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
	
		let oCell: UICollectionViewCell = collectionView.dequeueReusableCell(
			withReuseIdentifier: _COLLECTION_CELL_ID, for: indexPath
		);
		return oCell;
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: self.view.frame.width, height: 100);
	}
	
	@objc func mDoExit() -> Void {
		
		MainHandler.mDoExit();
	}
}

//
//  DemoData.swift
//  UICollectionView
//
//  Created by Alexandr Kirilov on 30/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

class DemoData: NSObject {

	static func mGet() -> [DemoCellModel] {
		
		return [
			DemoCellModel(
				Title: "Element1 Title", Description: "Element1 Description", Color: Colors.mRandom()
			),
			DemoCellModel(
				Title: "Element2 Title", Description: "Element2 Description", Color: Colors.mRandom()
			),
			DemoCellModel(
				Title: "Element3 Title", Description: "Element3 Description", Color: Colors.mRandom()
			),
			DemoCellModel(
				Title: "Element4 Title", Description: "Element4 Description", Color: Colors.mRandom()
			),
			DemoCellModel(
				Title: "Element5 Title", Description: "Element5 Description", Color: Colors.mRandom()
			),
			DemoCellModel(
				Title: "Element6 Title", Description: "Element6 Description", Color: Colors.mRandom()
			)
		];
	}
}

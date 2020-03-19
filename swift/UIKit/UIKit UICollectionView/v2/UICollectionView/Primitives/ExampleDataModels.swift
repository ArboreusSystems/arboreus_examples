//
//  ExampleDataModels.swift
//  UICollectionView
//
//  Created by Alexandr Kirilov on 18/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

struct ExampleItem {
	
	var ID: String = "Default string";
	var Title: String = "Default String";
	var Body: String = "Default String";
}

class ExampleData: NSObject {
	
	static func mGet() -> [ExampleItem] {
		
		var oOutput: [ExampleItem] = [];
		
		for iNumber in 1...10 {
			var iItem: ExampleItem = ExampleItem();
			iItem.ID = "Item" + String(iNumber) + " ID";
			iItem.Title = "Item" + String(iNumber) + " Title";
			iItem.Body = "Item" + String(iNumber) + " Body";
			oOutput.append(iItem);
		}
		
		return oOutput;
	}
}

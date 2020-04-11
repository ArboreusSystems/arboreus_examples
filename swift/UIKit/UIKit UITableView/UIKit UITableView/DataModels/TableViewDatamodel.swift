//
//  TableViewDatamodel.swift
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 01/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

import UIKit

enum DemoType: String {
	
	case TypeDefault = "Default type"
	case Type1 = "Type1"
	case Type2 = "Type2"
	case Type3 = "Type3"
}

struct DemoObject {
	
	var Name: String = "Default name";
	var TypeData: DemoType = DemoType.TypeDefault;
	
	init(inName: String, inTypeData: DemoType) {
		
		self.Name = inName;
		self.TypeData = inTypeData;
	}
}

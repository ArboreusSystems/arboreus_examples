//
//  StatesAbstraction.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-16.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

protocol StatesAbstraction {

	func mStateName() -> String;
	func mSetTestString(inTestString: String) -> (Bool,String);
	func mGetTestString() -> (Bool,String);
}

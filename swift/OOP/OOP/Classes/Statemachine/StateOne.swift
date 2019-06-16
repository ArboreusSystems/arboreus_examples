//
//  StateOne.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-16.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class StateOne: StatesAbstraction  {

	private let pStateName: String = "ONE";
	private var pTestString: String = "Initial value";

	func mStateName() -> String {

		return pStateName;
	}

	func mSetTestString(inTestString: String) -> (Bool,String) {

		pTestString = inTestString;
		return (true,"New Value installed");
	}

	func mGetTestString() -> (Bool,String) {

		return (true,pTestString);
	}
}

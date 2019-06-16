//
//  StateThree.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-16.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class StateThree: StatesAbstraction {

	private let pStateName: String = "THREE";
	private var pTestString: String = "Initial value";

	func mStateName() -> String {

		return pStateName;
	}

	func mSetTestString(inTestString: String) -> (Bool,String) {

		return (false,"In this state it's not available");
	}

	func mGetTestString() -> (Bool,String) {

		return (false,"In this state it's not available");
	}
}

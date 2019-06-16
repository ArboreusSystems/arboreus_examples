//
//  StateMachine.swift
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-16.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

enum StatesList {
	case One
	case Two
	case Three
}

class StateMachine {

	var pCurrentState: Optional<StatesAbstraction> = nil;

	init() {
		if (pCurrentState == nil) {
			mChangeState(inState: StatesList.One);
		}
	}

	func mChangeState(inState: StatesList) {

		switch inState {
			case StatesList.Two:
				pCurrentState = nil;
				pCurrentState = StateTwo();
			case StatesList.Three:
				pCurrentState = nil;
				pCurrentState = StateThree();
			default:
				pCurrentState = nil;
				pCurrentState = StateOne();
		}
		print("State changed onto:",pCurrentState!.mStateName());
	}

	func mCurrentState() -> String {

		return pCurrentState!.mStateName();
	}

	func mSetTestString(inTestString: String) -> Void {

		print(pCurrentState!.mSetTestString(inTestString: inTestString));
	}

	func mGetTestString() -> (Bool,String) {

		return pCurrentState!.mGetTestString();
	}
}

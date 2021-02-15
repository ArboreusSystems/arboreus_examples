//
//  DeferHandler.swift
//  Defer
//
//  Created by Alexandr Kirilov on 09/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class DeferHandler: NSObject {
	
	static func mDoDemo() -> Void {
		
		mDefer01();
		mDefer02();
		mDefer03();
		mDefer04();
	}
	
	private static func mDefer01() -> Void {
		
		print("\n****\n* DeferHandler.mDefer01()\n");
		defer {
    		print("Defered block at the begin");
		}
		print("Code at the end ");
	}
	
	private static func mDefer02() -> Void {
		
		print("\n****\n* DeferHandler.mDefer02()\n");
		
		defer {
			print("Defer at the begin");
		}
		defer {
			print("Defer at the end");
		}
		print("After defer");
	}
	
	private static func mDefer03() -> Void {
	
		print("\n****\n* DeferHandler.mDefer03()\n");
		
		var oMultiplier: Int = 1;
		for i in 0...10 {
			defer {
				print("Loop count: \(i), oMultiplier: \(oMultiplier)");
			}
			oMultiplier += oMultiplier * i;
		}
	}
	
	private static func mDefer04() -> Void {
		
		print("\n****\n* DeferHandler.mDefer04()\n");
		
		defer {
    		print("Cleaning up after execution");
		}
		do {
			try Data(contentsOf: URL(fileURLWithPath: "FakeURLForEmulatingThrow"));
		} catch {
			print("From try-catch");
		}
	}
}

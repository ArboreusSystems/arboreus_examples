//
//  ThreadHandler.swift
//  Thread
//
//  Created by Alexandr Kirilov on 06/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class ThreadHandler: NSObject {

	// MARK: NSThread

	static func mDoNSThread() -> Void {
	
		print("*****************\n* NSThread\n*****************");
		
		let oNSThread01: Thread = Thread {
			var oSum: Int = 0;
			for inNumber in 0...100 {
				oSum = oSum + inNumber;
				print("NSThread Thread01 for-loop value: \(inNumber), Sum: \(oSum)");
			}
		}
		oNSThread01.start();
		
		let oNSThread02: Thread = Thread {
			var oSum: Int = 0;
			for inNumber in 0...100 {
				oSum = oSum + inNumber;
				print("NSThread Thread02 for-loop value: \(inNumber), Sum: \(oSum)");
			}
		}
		oNSThread01.threadPriority = Double.random(in: 0...10);
		oNSThread02.start();
		
		let oNSThread03: Thread = Thread {
			var oSum: Int = 0;
			for inNumber in 0...100 {
				if (inNumber == 30) {
					oNSThread01.cancel();
					let oNSThread03_1: Thread = Thread {
						var oSum: Int = 0;
						for inNumber in 0...100 {
							oSum = oSum + inNumber;
							print("NSThread Thread3_1 for-loop value: \(inNumber), Sum: \(oSum)");
						}
					}
					oNSThread01.threadPriority = 100;
					oNSThread03_1.start();
				}
				oSum = oSum + inNumber;
				print("NSThread Thread03 for-loop value: \(inNumber), Sum: \(oSum)");
			}
		}
		oNSThread03.start();
		
		let oNSThread04: Thread = Thread {
			var oSum: Int = 0;
			for inNumber in 0...100 {
				oSum = oSum + inNumber;
				print("NSThread Thread04 for-loop value: \(inNumber), Sum: \(oSum)");
			}
		}
		oNSThread04.start();
		
	}
	
	// MARK: POSIX
	
	static func mDoPosix() -> Void {
	
		print("*****************\n* POSIX\n*****************");

		var oThread01: Optional<pthread_t> = pthread_t(bitPattern:0);
		var oThread01Attr: Optional<pthread_attr_t> = pthread_attr_t();
		pthread_attr_init(&oThread01Attr!);
		pthread_create(&oThread01,&oThread01Attr!,{(pointer) -> UnsafeMutableRawPointer? in
			for inNumber in 0...100 {
				print("POSIX Thread01 for-loop value: \(inNumber)");
			}
			return nil;
		}, nil);
		
		var oThread02: Optional<pthread_t> = pthread_t(bitPattern:1);
		var oThread02Attr: Optional<pthread_attr_t> = pthread_attr_t();
		pthread_attr_init(&oThread02Attr!);
		pthread_create(&oThread02,&oThread02Attr!,{(pointer) -> UnsafeMutableRawPointer? in
			for inNumber in 0...100 {
				print("POSIX Thread02 for-loop value: \(inNumber)");
			}
			return nil;
		}, nil);
		
		var oThread03: Optional<pthread_t> = pthread_t(bitPattern:2);
		var oThread03Attr: Optional<pthread_attr_t> = pthread_attr_t();
		pthread_attr_init(&oThread03Attr!);
		pthread_create(&oThread03,&oThread03Attr!,{(pointer) -> UnsafeMutableRawPointer? in
			for inNumber in 0...100 {
				print("POSIX Thread03 for-loop value: \(inNumber)");
			}
			return nil;
		}, nil);
		
		var oThread04: Optional<pthread_t> = pthread_t(bitPattern:3);
		var oThread04Attr: Optional<pthread_attr_t> = pthread_attr_t();
		pthread_attr_init(&oThread04Attr!);
		pthread_create(&oThread04,&oThread04Attr!,{(pointer) -> UnsafeMutableRawPointer? in
			for inNumber in 0...100 {
				print("POSIX Thread04 for-loop value: \(inNumber)");
			}
			return nil;
		}, nil);
	}
}

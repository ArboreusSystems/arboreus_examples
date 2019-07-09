//
//  ThreadSyncMutexHandler.swift
//  Thread
//
//  Created by Alexandr Kirilov on 09/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

enum LockTypes: Int {
	case Posix;
	case NSLock;
}

class ThreadSyncMutexHandler: NSObject {

	private var pMutexPosix: pthread_mutex_t = pthread_mutex_t();
	private var pMutexNSLock: NSLock = NSLock();
	private var pArray: Array<String> = Array();
	private var pFlagPosix: Int = 0;

	override init() {
		
		super.init();
		pthread_mutex_init(&pMutexPosix,nil);
	}

	func mLockWrapperNSLock(inAction: () -> ()) -> Void {
		
		defer {
			pMutexNSLock.unlock();
		}
		pMutexNSLock.lock();
		inAction();
	}
	
	func mLockWrapperPosix(inAction: () -> ()) -> Void {
		
		defer {
			pthread_mutex_unlock(&self.pMutexPosix);
		}
		pthread_mutex_lock(&self.pMutexPosix);
		inAction();
	}
	
	func mDoDemoNSlock() -> Void {
		
		let oNSThread01: Thread = Thread {
			for inNumber in 0...100 {
				self.mLockWrapperNSLock {
					self.pArray.append("oNSThread01: \(inNumber)");
				}
			}
			self.pFlagPosix = self.pFlagPosix + 1;
			if (self.pFlagPosix == 5) {
				self.mDumpDemo();
			}
		}
		oNSThread01.qualityOfService = .background;
		
		let oNSThread02: Thread = Thread {
			for inNumber in 0...100 {
				self.mLockWrapperNSLock {
					self.pArray.append("oNSThread02: \(inNumber)");
				}
			}
			self.pFlagPosix = self.pFlagPosix + 1;
			if (self.pFlagPosix == 5) {
				self.mDumpDemo();
			}
		}
		oNSThread02.qualityOfService = .default;
		
		let oNSThread03: Thread = Thread {
			for inNumber in 0...100 {
				self.mLockWrapperNSLock {
					self.pArray.append("oNSThread03: \(inNumber)");
				}
			}
			self.pFlagPosix = self.pFlagPosix + 1;
			if (self.pFlagPosix == 5) {
				self.mDumpDemo();
			}
		}
		oNSThread03.qualityOfService = .userInitiated;
		
		let oNSThread04: Thread = Thread {
			for inNumber in 0...100 {
				self.mLockWrapperNSLock {
					self.pArray.append("oNSThread04: \(inNumber)");
				}
			}
			self.pFlagPosix = self.pFlagPosix + 1;
			if (self.pFlagPosix == 5) {
				self.mDumpDemo();
			}
		}
		oNSThread04.qualityOfService = .userInteractive;
		
		let oNSThread05: Thread = Thread {
			for inNumber in 0...100 {
				self.mLockWrapperNSLock {
					self.pArray.append("oNSThread05: \(inNumber)");
				}
			}
			self.pFlagPosix = self.pFlagPosix + 1;
			if (self.pFlagPosix == 5) {
				self.mDumpDemo();
			}
		}
		oNSThread05.qualityOfService = .utility;
		
		oNSThread01.start();
		oNSThread02.start();
		oNSThread03.start();
		oNSThread04.start();
		oNSThread05.start();
	}
	
	func mDoDemoPosix() -> Void {
		
		let oNSThread01: Thread = Thread {
			for inNumber in 0...100 {
				self.mLockWrapperPosix {
					self.pArray.append("oNSThread01: \(inNumber)");
				}
			}
			self.pFlagPosix = self.pFlagPosix + 1;
			if (self.pFlagPosix == 5) {
				self.mDumpDemo();
			}
		}
		oNSThread01.qualityOfService = .background;
		
		let oNSThread02: Thread = Thread {
			for inNumber in 0...100 {
				self.mLockWrapperPosix {
					self.pArray.append("oNSThread02: \(inNumber)");
				}
			}
			self.pFlagPosix = self.pFlagPosix + 1;
			if (self.pFlagPosix == 5) {
				self.mDumpDemo();
			}
		}
		oNSThread02.qualityOfService = .default;
		
		let oNSThread03: Thread = Thread {
			for inNumber in 0...100 {
				self.mLockWrapperPosix {
					self.pArray.append("oNSThread03: \(inNumber)");
				}
			}
			self.pFlagPosix = self.pFlagPosix + 1;
			if (self.pFlagPosix == 5) {
				self.mDumpDemo();
			}
		}
		oNSThread03.qualityOfService = .userInitiated;
		
		let oNSThread04: Thread = Thread {
			for inNumber in 0...100 {
				self.mLockWrapperPosix {
					self.pArray.append("oNSThread04: \(inNumber)");
				}
			}
			self.pFlagPosix = self.pFlagPosix + 1;
			if (self.pFlagPosix == 5) {
				self.mDumpDemo();
			}
		}
		oNSThread04.qualityOfService = .userInteractive;
		
		let oNSThread05: Thread = Thread {
			for inNumber in 0...100 {
				self.mLockWrapperPosix {
					self.pArray.append("oNSThread05: \(inNumber)");
				}
			}
			self.pFlagPosix = self.pFlagPosix + 1;
			if (self.pFlagPosix == 5) {
				self.mDumpDemo();
			}
		}
		oNSThread05.qualityOfService = .utility;
		
		oNSThread01.start();
		oNSThread02.start();
		oNSThread03.start();
		oNSThread04.start();
		oNSThread05.start();
	}
	
	func mDumpDemo() -> Void {
		
		print("pArray.count: ",pArray.count);
		for inString in pArray {
			print("\(inString)");
		}
	}
}

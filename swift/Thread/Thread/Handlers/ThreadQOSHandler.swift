//
//  ThreadQOSHandler.swift
//  Thread
//
//  Created by Alexandr Kirilov on 09/07/2019.
//  Copyright © 2019 Arboreus. All rights reserved.
//

import UIKit

class ThreadQOSHandler: NSObject {

	static func mDoNSThread() -> Void {
	
		let oNSThread01: Thread = Thread {
			for inNumber in 0...100 {
				print("oNSThread01 QOS: \(qos_class_self()), value: \(inNumber)");
			}
		}
		oNSThread01.qualityOfService = .background;
		
		let oNSThread02: Thread = Thread {
			for inNumber in 0...100 {
				print("oNSThread02 QOS: \(qos_class_self()), value: \(inNumber)");
			}
		}
		oNSThread02.qualityOfService = .default;
		
		let oNSThread03: Thread = Thread {
			for inNumber in 0...100 {
				print("oNSThread03 QOS: \(qos_class_self()), value: \(inNumber)");
			}
		}
		oNSThread03.qualityOfService = .userInitiated;
		
		let oNSThread04: Thread = Thread {
			for inNumber in 0...100 {
				if (inNumber == 50) {
					oNSThread01.qualityOfService = .userInteractive;
				}
				print("oNSThread04 QOS: \(qos_class_self()), value: \(inNumber)");
			}
		}
		oNSThread04.qualityOfService = .userInteractive;
		
		let oNSThread05: Thread = Thread {
			for inNumber in 0...100 {
				print("oNSThread05 QOS: \(qos_class_self()), value: \(inNumber)");
			}
		}
		oNSThread05.qualityOfService = .utility;
		
		oNSThread01.start();
		oNSThread02.start();
		oNSThread03.start();
		oNSThread04.start();
		oNSThread05.start();
	}

	static func mDoPosix() -> Void {
		
		var oThreadQosDEFAULT: Optional<pthread_t> = pthread_t(bitPattern:0);
		var oThreadQosDEFAULTAttr: Optional<pthread_attr_t> = pthread_attr_t();
		pthread_attr_init(&oThreadQosDEFAULTAttr!);
		pthread_attr_set_qos_class_np(&oThreadQosDEFAULTAttr!,QOS_CLASS_DEFAULT,0);
		pthread_create(&oThreadQosDEFAULT,&oThreadQosDEFAULTAttr!,{(pointer) -> UnsafeMutableRawPointer? in
			for inNumber in 0...100 {
				print("POSIX QOS_CLASS_DEFAULT for-loop value: \(inNumber)");
			}
			return nil;
		}, nil);
		
		var oThreadQosUTILITY: Optional<pthread_t> = pthread_t(bitPattern:1);
		var oThreadQosUTILITYAttr: Optional<pthread_attr_t> = pthread_attr_t();
		pthread_attr_init(&oThreadQosUTILITYAttr!);
		pthread_attr_set_qos_class_np(&oThreadQosUTILITYAttr!,QOS_CLASS_UTILITY,0);
		pthread_create(&oThreadQosUTILITY,&oThreadQosUTILITYAttr!,{(pointer) -> UnsafeMutableRawPointer? in
			for inNumber in 0...100 {
				print("POSIX QOS_CLASS_UTILITY for-loop value: \(inNumber)");
			}
			return nil;
		}, nil);
		
		var oThreadQosBACKGROUND: Optional<pthread_t> = pthread_t(bitPattern:2);
		var oThreadQosBACKGROUNDAttr: Optional<pthread_attr_t> = pthread_attr_t();
		pthread_attr_init(&oThreadQosBACKGROUNDAttr!);
		pthread_attr_set_qos_class_np(&oThreadQosBACKGROUNDAttr!,QOS_CLASS_BACKGROUND,0);
		pthread_create(&oThreadQosBACKGROUND,&oThreadQosBACKGROUNDAttr!,{(pointer) -> UnsafeMutableRawPointer? in
			for inNumber in 0...100 {
				print("POSIX QOS_CLASS_BACKGROUND for-loop value: \(inNumber)");
			}
			return nil;
		}, nil);
		
		var oThreadQosUNSPECIFIED: Optional<pthread_t> = pthread_t(bitPattern:3);
		var oThreadQosUNSPECIFIEDAttr: Optional<pthread_attr_t> = pthread_attr_t();
		pthread_attr_init(&oThreadQosUNSPECIFIEDAttr!);
		pthread_attr_set_qos_class_np(&oThreadQosUNSPECIFIEDAttr!,QOS_CLASS_UNSPECIFIED,0);
		pthread_create(&oThreadQosUNSPECIFIED,&oThreadQosUNSPECIFIEDAttr!,{(pointer) -> UnsafeMutableRawPointer? in
			for inNumber in 0...100 {
				print("POSIX QOS_CLASS_UNSPECIFIED for-loop value: \(inNumber)");
			}
			return nil;
		}, nil);
		
		var oThreadQosUSER_INITIATED: Optional<pthread_t> = pthread_t(bitPattern:4);
		var oThreadQosUSER_INITIATEDAttr: Optional<pthread_attr_t> = pthread_attr_t();
		pthread_attr_init(&oThreadQosUSER_INITIATEDAttr!);
		pthread_attr_set_qos_class_np(&oThreadQosUSER_INITIATEDAttr!,QOS_CLASS_USER_INITIATED,0);
		pthread_create(&oThreadQosUSER_INITIATED,&oThreadQosUSER_INITIATEDAttr!,{(pointer) -> UnsafeMutableRawPointer? in
			for inNumber in 0...100 {
				print("POSIX QOS_CLASS_USER_INITIATED for-loop value: \(inNumber)");
			}
			return nil;
		}, nil);
		
		var oThreadQosUSER_INTERACTIVE: Optional<pthread_t> = pthread_t(bitPattern:5);
		var oThreadQosUSER_INTERACTIVEAttr: Optional<pthread_attr_t> = pthread_attr_t();
		pthread_attr_init(&oThreadQosUSER_INTERACTIVEAttr!);
		pthread_attr_set_qos_class_np(&oThreadQosUSER_INTERACTIVEAttr!,QOS_CLASS_USER_INTERACTIVE,0);
		pthread_create(&oThreadQosUSER_INTERACTIVE,&oThreadQosUSER_INTERACTIVEAttr!,{(pointer) -> UnsafeMutableRawPointer? in
			for inNumber in 0...100 {
				print("POSIX QOS_CLASS_USER_INTERACTIVE for-loop value: \(inNumber)");
			}
			return nil;
		}, nil);
	}
}

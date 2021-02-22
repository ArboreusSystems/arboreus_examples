//
//  AEnum.swift
//  Enum_v1
//
//  Created by Alexandr Kirilov on 21.02.2021.
//

import Foundation

class AEnum {
    
    static let pInstance: AEnum = AEnum();
    
    enum TestEnumSimple {
        case Value1;
        case Value2;
        case Value3;
    }
    
    enum TestAssociativeDirection {
        case Left;
        case Right;
    }
    
    enum TestAssociative {
        case Walk(inDistance: Int);
        case Stop;
        case Pause(inTime: Int);
        case Turn(inDirection: TestAssociativeDirection);
    }
    
    enum TestRaw: String {
		case Left = "Left";
		case Right = "Right"
	}
    
    private init() {
        
        print("AEnum created");
    }
    
    deinit {
        
        print("AEnum deleted");
    }
    
    func mTestSimple() -> Void {
        
        print("------------\nmTestSimple");
        
        var oTestEnumValue: AEnum.TestEnumSimple = AEnum.TestEnumSimple.Value1;
        let oCheckEnumValue = {
            if (oTestEnumValue == TestEnumSimple.Value1) {
                print("TestEnumValue = Value1");
            } else if (oTestEnumValue == TestEnumSimple.Value2) {
                print("TestEnumValue = Value2");
            } else if (oTestEnumValue == TestEnumSimple.Value3) {
                print("TestEnumValue = Value3");
            }
        }
        oCheckEnumValue();
        
        oTestEnumValue = AEnum.TestEnumSimple.Value2;
        oCheckEnumValue();
        
        oTestEnumValue = AEnum.TestEnumSimple.Value3;
        oCheckEnumValue();
    }
    
    func mTestAssociative() -> Void {
        
        print("------------\nmTestAssociative");
        
        let oActionStop = {
            print("Stopped");
        }
        
        let oActionWalkLong: (Int) -> Void = { inDistance in
            print("Walking long",inDistance,"meters");
        }
        
        let oActionWalkShort: (Int) -> Void = { inDistance in
            print("Walking short",inDistance,"meters");
        }
        
        let oActionPause: (Int) -> Void = { inTime in
            print("Paused",inTime,"seconds");
        }
                
        let oActionTurn: (TestAssociativeDirection) -> Void = { inDirection in
            switch inDirection {
                case .Left: print("Turning Left");
                default: print("Turning Right");
            }
        }
        
        let oScenario: [TestAssociative] = [
            .Walk(inDistance: 10),
            .Turn(inDirection: .Left),
            .Walk(inDistance: 5),
            .Pause(inTime: 5),
            .Walk(inDistance: 25),
            .Turn(inDirection: .Right),
            .Walk(inDistance: 5),
            .Turn(inDirection: .Right),
            .Walk(inDistance: 10),
            .Stop
        ];
        
        oScenario.forEach({ inStep in
        	switch inStep {
        		case .Walk(let caseDistance) where caseDistance < 20:
        			oActionWalkShort(caseDistance);
				case .Walk(let caseDistance):
					oActionWalkLong(caseDistance);
				case .Pause(let caseTime):
					oActionPause(caseTime);
				case .Turn(let caseDirection):
					oActionTurn(caseDirection);
				default:
					oActionStop();
			}
		})
    }
    
	func mTestRaw() -> Void {
		
		print("------------\nmTestAssociative");
		print("Left value:",AEnum.TestRaw.Left.rawValue);
		print("Right value:",AEnum.TestRaw.Right.rawValue);
		
		let pRawValue: TestRaw = TestRaw(rawValue: "Left")!;
		if (pRawValue == .Right) {
			print("pRawValue = Right");
		}
		if (pRawValue == .Left) {
			print("pRawValue = Left");
		}
	}
	
	func mTestTrick1() -> Void {
		
		print("------------\nmTestTrick1");
		
		enum oEnumTest: RawRepresentable {
			
			case One;
			case Two;
			
			init?(rawValue: Int) {
				self = .One
			}
			
			var rawValue: Int {
				return 1;
			}
		}
		
		print("Test result:",oEnumTest.One == oEnumTest.Two);
	}
	
	func mTestTrick2() -> Void {
		
		print("------------\nmTestTrick2");
		
		enum oEnumTest: RawRepresentable {
			
			case One;
			case Two;
			
			init?(rawValue: Int) {
				self = .One
			}
			
			var rawValue: Int {
				return 1;
			}
		}
		
		var oValue = oEnumTest.Two;
		
		switch oValue {
			case .One: print("One");
			case .Two: print("Two");
		}
	}
	
	func mTestTrick3() -> Void {
		
		print("------------\nmTestTrick3");
		
		enum oEnumTest: Int {
			case a, b = 100, c, d = 999, e
		}
		
		print("oEnumTest.a:",oEnumTest.a,"RawValue =",oEnumTest.a.rawValue);
		print("oEnumTest.b:",oEnumTest.b,"RawValue =",oEnumTest.b.rawValue);
		print("oEnumTest.c:",oEnumTest.c,"RawValue =",oEnumTest.c.rawValue);
		print("oEnumTest.d:",oEnumTest.d,"RawValue =",oEnumTest.d.rawValue);
		print("oEnumTest.e:",oEnumTest.e,"RawValue =",oEnumTest.e.rawValue);
	}
}

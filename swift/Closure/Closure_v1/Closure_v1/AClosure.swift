//
//  AClosure.swift
//  Closure_v1
//
//  Created by Alexandr Kirilov on 20.02.2021.
//

import Foundation

class AClosure {
    
    static let pInstance: AClosure = AClosure();
    
    private init() {
        
        print("AClosure created");
    }
    
    deinit {
        
        print("AClosure deleted");
    }
    
    func mTestSimple() -> Void {
        
        print("------------\nmTestSimple");
        
        let oSimpleClosure = {
            print("From Simple Closure");
        }
        oSimpleClosure();
    
    }
    
    func mTestWithParameters() -> Void {
        
        print("------------\nmTestWithParameters");
        
        let oClosureWithParameters: (String) -> Void = { inParameter in
            print("Value of parameter: ",inParameter);
        }
        
        oClosureWithParameters("TestParameterValue");
    }
    
    func mTestReturnValue() -> Void {
        
        print("------------\nmTestReturnValue");
        
        let oClosureReturnValue: (String) -> (String) = { inValue in
            return inValue;
        }
        
        print("Retuned value: ",oClosureReturnValue("ValueToBeReturned"));
    }
    
    func mTestTrick() -> Void {
        
        print("------------\nmTestTrick");
        
        var oTestValue: String = "Initial";
        print("From code: ",oTestValue);
        
        let oClosure1 = { [oTestValue] in
            print("From oClosure1: ",oTestValue);
        };
        let oClosure2 = {
            print("From oClosure2: ",oTestValue);
        };
        let oClosure3: (String) -> (Void) = { inValue in
            print("From oClosure3: ",inValue);
        };
        oClosure1();
        oClosure2();
        oClosure3(oTestValue);
        
        oTestValue = "Changed";
        print("From code: ",oTestValue);
        oClosure1();
        oClosure2();
        oClosure3(oTestValue);
    }
}

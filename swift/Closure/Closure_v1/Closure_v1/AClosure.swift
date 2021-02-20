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
        
        var oTestValue: String = "1";
        print("From code. Step 1: ",oTestValue);
        
        let oClosure = { [oTestValue] in
            
            print("From closure. Step: ",oTestValue);
        };
        oClosure();
        
        oTestValue = "2";
        print("From code. Step 2: ",oTestValue);
        oClosure();
    }
}

//
//  ADefer.swift
//  Defer_v2
//
//  Created by Alexandr Kirilov on 15.02.2021.
//

import Foundation

class ADefer: NSObject {
    
    func mDeferTest() -> String {
        
        var oString = "";
        
        oString += "A";
        NSLog("Defer example -> Step 1: %@", oString);
        
        defer {
            oString += "B";
            NSLog("Defer example -> Step 2: %@", oString);
        }
        
        if true {
            defer {
                oString += "C";
                NSLog("Defer example -> Step 3: %@", oString);
            }
            defer {
                oString += "D";
                NSLog("Defer example -> Step 4: %@", oString);
            }
            oString += "E";
            NSLog("Defer example -> Step 5: %@", oString);
        }
        
        oString += "F";
        NSLog("Defer example -> Step 6: %@", oString);
        
        defer {
            oString += "G";
            NSLog("Defer example -> Step 7: %@", oString);
        }
        
        return oString;
    }
}

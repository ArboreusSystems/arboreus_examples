//
//  main.m
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import <UIKit/UIKit.h>

#import "AAppDelegate.h"

int main(int inCounter, char* inArguments[]) {
    
    NSString* oAppDelegateClassName;
        @autoreleasepool {
            oAppDelegateClassName = NSStringFromClass([AAppDelegate class]);
    }
    
    return UIApplicationMain(inCounter, inArguments, nil, oAppDelegateClassName);
}

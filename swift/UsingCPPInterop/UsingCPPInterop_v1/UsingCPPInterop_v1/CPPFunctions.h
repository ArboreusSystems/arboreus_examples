//
//  CPPFunctions.h
//  UsingCPPInterop_v1
//
//  Created by Alexandr Kirilov on 01/10/2024.
//

#ifndef CPPFunctions_h
#define CPPFunctions_h

#include <stdio.h>
#include <string>
#include <swift/bridging>

int gGetNumber(int inLimit) SWIFT_NAME(gGetNumber(_:));
std::string gGetCPPString();

#endif /* CPPFunctions_h */

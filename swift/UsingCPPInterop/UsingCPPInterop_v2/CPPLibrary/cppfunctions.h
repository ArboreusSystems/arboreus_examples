//
//  cppfunctions.hpp
//  UsingCPPInterop_v2
//
//  Created by Alexandr Kirilov on 03/10/2024.
//

#ifndef CPPFunctions_h
#define CPPFunctions_h

#include <stdio.h>
#include <string>
#include <cstdlib>
#include <swift/bridging>

int gGetNumber(int inLimit) SWIFT_NAME(gGetNumber(_:));
std::string gGetCPPString();

#endif /* CPPFunctions_h */

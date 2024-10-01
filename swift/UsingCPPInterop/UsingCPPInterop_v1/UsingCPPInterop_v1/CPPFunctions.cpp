//
//  CPPFunctions.cpp
//  UsingCPPInterop_v1
//
//  Created by Alexandr Kirilov on 01/10/2024.
//

#include "CPPFunctions.h"


int gGetNumber(int inLimit) {

    return rand() % inLimit;
}

std::string gGetCPPString(void) {

	return "CPPString";
}

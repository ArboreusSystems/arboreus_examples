//
//  cppfunctions.cpp
//  UsingCPPInterop_v2
//
//  Created by Alexandr Kirilov on 03/10/2024.
//

#include "cppfunctions.h"

int gGetNumber(int inLimit) {
	
	srand((unsigned) time(NULL));
	int oRrandom = rand();
	
    return oRrandom % inLimit;
}

std::string gGetCPPString(void) {

	return "CPPString";
}

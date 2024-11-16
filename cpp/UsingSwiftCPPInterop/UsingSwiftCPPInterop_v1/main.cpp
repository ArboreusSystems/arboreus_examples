/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 05/11/2024 at 21:20:25
 * */// --------------------------------------------------------------

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <Logger/alogger.h>

// Swift includes
#include <SwiftCPP.h>

// Namespace
using namespace std;


// Console Application
int main(int inCounter, char* inArguments[]) {

	ALOG << UsingSwiftCPPInterop_v1::mTest() << endl;

	ALOG << "UsingSwiftCPPInterop_v1" << endl;

	return 0;
}

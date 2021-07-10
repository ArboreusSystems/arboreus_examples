// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 10/07/2021 at 10:15:16
	\endlist
*/
// ----------------------------------------------------------
#ifndef AFUNCTIONS_H
#define AFUNCTIONS_H

// System includes
#include <iostream>

// Application includes
#include <aglobal.h>

// Constants and defintions

// Namespace
using namespace std;

// Static functions

void fPrintInteger(int* inInteger) {

	cout << "Integer: " << *inInteger << endl;
}

void fPrintChar(char* inChar) {

	cout << "Char: " << *inChar << endl;
}

void fPrintBoolean(bool* inBoolean) {

	cout << "Boolean: " << *inBoolean << endl;
}

void fPrint(void* inPointer,ATypes inType) {

	switch (inType) {
		case ATypes::Integer: fPrintInteger(static_cast<int*>(inPointer)); break;
		case ATypes::Char: fPrintChar(static_cast<char*>(inPointer)); break;
		case ATypes::Boolean: fPrintBoolean(static_cast<bool*>(inPointer)); break;
		default: break;
	}
}


#endif // AFUNCTIONS_H

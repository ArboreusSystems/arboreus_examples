// ----------------------------------------------------------
/*!
	\class AStaticTable
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/02/2020 at 12:47:11
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "astatictable.h"

using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

AStaticTable::AStaticTable(void) {}


// -----------
/*!
	\fn

	Doc.
*/

AStaticTable::~AStaticTable(void) {}


// -----------
/*!
	\fn

	Doc.
*/

string AStaticTable::mCreateNumber(char inChar,int inLength) {

	string oOutput = to_string(static_cast<int>(inChar));
	string oZeroField = "";
	for (int i = 0; i < (inLength - static_cast<int>(oOutput.length())); i++) {
		oZeroField = oZeroField + "0";
	}
	return oZeroField + oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

string AStaticTable::mCreateChar(string inNumber) {

	string oOutput;
	oOutput += static_cast<char>(stoi(inNumber));
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

string AStaticTable::mEncrypt(string inText) {

	string oOutput;
	for (int i = 0; i < static_cast<int>(inText.length()); i++) {
		oOutput += mCreateNumber(inText.at(i),A_DEMO_LENGTH_OF_VALUE);
	}
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

string AStaticTable::mDecrypt(string inText) {

	string oOutput;

	for (int i = 0; i < static_cast<int>(inText.length()); i = i + A_DEMO_LENGTH_OF_VALUE) {
		string iValue;
		for (int j = 0; j < A_DEMO_LENGTH_OF_VALUE; j++) {
			iValue = iValue + inText[i + j];
		}
		oOutput = oOutput + mCreateChar(iValue);
	}

	return oOutput;
}

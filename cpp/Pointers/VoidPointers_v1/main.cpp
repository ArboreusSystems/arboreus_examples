/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 10/07/2021 at 10:10:59
 * */// --------------------------------------------------------------

// System includes
#include <iostream>

// Application includes
#include <aglobal.h>
#include <afunctions.h>

// Namespace
using namespace std;

// Constants


// Static functions



int main(int inCounter, char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	int oInteger = 105;
	char oChar = 'c';
	bool oBoolean = true;

	cout << "VoidPointers v1" << endl;

	cout << "\nIntegers:" << endl;
	cout << "-------" << endl;
	fPrint(&oInteger,ATypes::Integer);
	fPrint(&oChar,ATypes::Integer);

	cout << "\nChars:" << endl;
	cout << "-------" << endl;
	fPrint(&oInteger,ATypes::Char);
	fPrint(&oChar,ATypes::Char);

	cout << "\nBooleans:" << endl;
	cout << "-------" << endl;
	fPrint(&oBoolean,ATypes::Boolean);

	return 0;
}

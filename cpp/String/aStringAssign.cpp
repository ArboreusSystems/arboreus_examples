//
// Created by Alexandr Kirilov on 26/09/2019.
//

#include "aStringAssign.h"

void aStringAssign::mDoTest(void) {

	cout << "\n* ---------------------\n" << "* String assign\n" << endl;

	string oAssignedString;
	oAssignedString.assign(4,'.');
	cout << "oAssignedString: " << oAssignedString << endl;

	string const oAssignedStringConst("AssignedStringConst");
	oAssignedString.assign(oAssignedStringConst);
	cout << oAssignedString << " == " << oAssignedStringConst << endl;

	string oNumbersInString = "0123456789";
	oAssignedString.assign(oNumbersInString,0,oNumbersInString.length() - 1);
	cout << "Assigned with length: " << oAssignedString << endl;

	cout << "Assigned by length: " << oAssignedString.assign(oNumbersInString,5) << endl;
	cout << "Assigned by constructor: " << oAssignedString.assign(string("String from ") + "Constructor");
	cout << "Assigned charT const *: " << oAssignedString.assign("String1\0String2") << endl;

	char oCStringMutable[] = "Plain C String";
	oAssignedString.assign(begin(oCStringMutable),end(oCStringMutable) - 1);
	cout << "Assigned from plain C string: " << oAssignedString;

	oAssignedString.assign({'F','r','o','m',' ','l','i','s','t'});
	cout << "Assigned from list: " << oAssignedString << endl;
}
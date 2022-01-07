//
// Created by Alexandr Kirilov on 26/09/2019.
//

#include "aStringBasic.h"

void aStringBasic::mDoTest(void) {

	cout << "\n* ---------------------\n" << "* String basic\n" << endl;

	string oHello; oHello = "Hello";
	string oWorld = "world";
	cout << "1:" << oHello << " " << oWorld << "!" << endl;
	string oHelloWorld(oHello + " " + oWorld + "!");
	cout << "2:"<< oHelloWorld << endl;

	cout << "oHelloWorld size: " << oHelloWorld.size() << endl;
	cout << "oHelloWorld length: " << oHelloWorld.length() << endl;
}
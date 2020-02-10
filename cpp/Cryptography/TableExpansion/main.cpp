#include <iostream>
#include <vector>
#include <string>
#include <chrono>
#include <thread>

#include "aglobal.hpp"
#include "afile.hpp"
#include "arandombook.h"
#include "arandom.hpp"

#include <stdio.h>      /* printf, NULL */
#include <stdlib.h>     /* srand, rand */
#include <time.h>

using namespace std;

int main() {

	cout << "Arboreus Crytograhy Example" << endl;
	cout << "Table Expansion" << endl;

	string oTestString = "Test String";
	vector<char> oBytes(oTestString.begin(),oTestString.end());
	oBytes.push_back('\0');

	cout << "Byte[0]: " << static_cast<int>(oBytes[2]) << endl;
	cout << "Byte[0]: " << oBytes[2] << endl;
	cout << "Byte[0]: " << static_cast<char>(115) << endl;

	ALOG << "PWD: " << AGlobal::mPwd() << endl;
	ALOG << "File exist: " << AFile::mExist(AGlobal::mPwd() + "/file") << endl;

	AFile::mSave(AGlobal::mPwd() + "/test.file",oBytes);
	AFile::mSave(AGlobal::mPwd() + "/test1.file",oTestString);

	printf ("First number: %d\n", rand()%100);
  srand (time(NULL));
  printf ("Random number: %d\n", rand()%100);
  srand (1);
  printf ("Again the first number: %d\n", rand()%100);

	for (int i = 0; i < 10; i++) {
		ALOG << i << ": " << ARandom::mNumberNoExponent() << endl;

	}

	ALOG << "Size long long: " << sizeof(long long) << endl;

	return 0;
}

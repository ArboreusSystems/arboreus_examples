#include <iostream>
#include <vector>
#include <string>
#include <chrono>
#include <thread>

#include "aglobal.h"
#include "afile.h"
#include "arandombook.h"
#include "arandom.h"


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
	ALOG << "String from file1:" << AFile::mReadString(AGlobal::mPwd() + "/test.file") << endl;

	AFile::mSave(AGlobal::mPwd() + "/test1.file",oTestString);
	ALOG << "String from file2:" << AFile::mReadString(AGlobal::mPwd() + "/test1.file") << endl;

	vector<long long> oDictionary = ARandom::mList(ARandomDictionaryType::Free,5);
	vector<long long>::iterator oDictionaryIterator = oDictionary.begin();
	while (oDictionaryIterator != oDictionary.end()) {
		ALOG << "Dictionary value: " << *oDictionaryIterator << endl;
		oDictionaryIterator++;
	}

	AFile::mSave(AGlobal::mPwd() + "/test2.file",oDictionary);

	oDictionary = AFile::mReadLongLong(AGlobal::mPwd() + "/test2.file");
	oDictionaryIterator = oDictionary.begin();
	while (oDictionaryIterator != oDictionary.end()) {
		ALOG << "Dictionary value1: " << *oDictionaryIterator << endl;
		oDictionaryIterator++;
	}

	return 0;
}

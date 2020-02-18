// ----------------------------------------------------------
/*!
	\class AFile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/02/2020 at 22:19:11
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "afile.h"

using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

AFile::AFile(void) {}


// -----------
/*!
	\fn

	Doc.
*/

AFile::~AFile(void) {}


// -----------
/*!
	\fn

	Doc.
*/

bool AFile::mExist(const string& inPath) {

	struct stat oBuffer;
	return (stat(inPath.c_str(),&oBuffer) == 0);
}


// -----------
/*!
	\fn

	Doc.
*/

void AFile::mSave(const string& inPath,const string& inString) {

	ofstream oFile(inPath);
	oFile << inString;
	oFile.close();
}


// -----------
/*!
	\fn

	Doc.
*/

void AFile::mSave(const string& inPath,vector<char> inData) {

	ofstream oFile(inPath);

	vector<char>::iterator oIterator = inData.begin();
	while (oIterator != inData.end()) {
		oFile << *oIterator;
		oIterator++;
	}

	oFile.close();
}


// -----------
/*!
	\fn

	Doc.
*/

void AFile::mSave(const string &inPath, std::vector<long long> inData) {

	ofstream oFile(inPath);

	vector<long long>::iterator oIterator = inData.begin();
	while (oIterator != inData.end()) {
		ANumberUnion oNumber;
		oNumber.Number = *oIterator;
		oFile << oNumber.Byte[0];
		oFile << oNumber.Byte[1];
		oFile << oNumber.Byte[2];
		oFile << oNumber.Byte[3];
		oFile << oNumber.Byte[4];
		oFile << oNumber.Byte[5];
		oFile << oNumber.Byte[6];
		oFile << oNumber.Byte[7];
		oIterator++;
	}

	oFile.close();
}


// -----------
/*!
	\fn

	Doc.
*/

string AFile::mReadString(const string& inPath) {

	string oOutput = "error";

	ifstream oFile(inPath);
	if (oFile.is_open() && !oFile.fail()) {
		string oString(
			(istreambuf_iterator<char>(oFile)),
			istreambuf_iterator<char>()
		);
		oOutput = oString;
	}
	oFile.close();

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

vector<char> AFile::mReadChars(const string& inPath) {

	vector<char> oOutput = {'e','r','r','o','r'};

	ifstream oFile(inPath,ios::binary);
	if (oFile.is_open() && !oFile.fail()) {
		vector<char> oChars(
			(istreambuf_iterator<char>(oFile)),
			(istreambuf_iterator<char>())
		);
		oOutput = oChars;
	}

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

vector<long long> AFile::mReadLongLong(const string& inPath) {

	vector<long long> oOutput = {};
	vector<char> oError = {'e','r','r','o','r'};
	ANumberUnion oNumber;

	vector<char> oChars = mReadChars(inPath);
	if ((oChars.size() % 8) == 0 && oChars != oError) {
		for (int i = 0; i < static_cast<int>(oChars.size()); i = i + 8) {
			oNumber.Byte[0] = oChars[i];
			oNumber.Byte[1] = oChars[i + 1];
			oNumber.Byte[2] = oChars[i + 2];
			oNumber.Byte[3] = oChars[i + 3];
			oNumber.Byte[4] = oChars[i + 4];
			oNumber.Byte[5] = oChars[i + 5];
			oNumber.Byte[6] = oChars[i + 6];
			oNumber.Byte[7] = oChars[i + 7];
			oOutput.push_back(oNumber.Number);
		}
	}

	return oOutput;
}


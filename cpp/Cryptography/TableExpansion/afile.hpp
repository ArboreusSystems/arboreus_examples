// ----------------------------------------------------------
/*!
	\headerfile AFile
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2020 at 16:09:47
	\endlist
*/
// ----------------------------------------------------------
#ifndef AFILE_H
#define AFILE_H

// System includes
#include <iostream>
#include <string>
#include <sys/stat.h>
#include <unistd.h>
#include <fstream>
#include <vector>

// Application includes
#include "aglobal.hpp"

// Constants and definitions

using namespace std;

class AFile {

	public:

		static bool mExist(const string& inPath) {

			struct stat oBuffer;
			return (stat(inPath.c_str(),&oBuffer) == 0);
		}

		static void mSave(const string& inPath,const string& inString) {

			ofstream oFile(inPath);
			oFile << inString;
			oFile.close();
		}

		static void mSave(const string& inPath,vector<char> inData) {

			ofstream oFile(inPath);

			vector<char>::iterator oIterator = inData.begin();
			while (oIterator != inData.end()) {
				oFile << *oIterator;
				oIterator++;
			}

			oFile.close();
		}
};

#endif // AFILE_H

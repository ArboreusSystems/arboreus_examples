// ----------------------------------------------------------
/*!
	\headerfile AFile
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/02/2020 at 22:19:11
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
#include <streambuf>
#include <iterator>

// Application includes
#include "aglobal.h"
#include "afiledatamodels.h"

// Constants and definitions

// Class definitions
class AFile {

	public:

		AFile(void);
		~AFile(void);

		static bool mExist(const std::string& inPath);
		static void mSave(const std::string& inPath,const std::string& inString);
		static void mSave(const std::string& inPath,std::vector<char> inData);
		static void mSave(const std::string& inPath,std::vector<long long> inData);
		static std::string mReadString(const std::string& inPath);
		static std::vector<char> mReadChars(const std::string& inPath);
		static std::vector<long long> mReadLongLong(const std::string& inPath);
};

#endif // AFILE_H

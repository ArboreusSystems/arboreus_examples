// ----------------------------------------------------------
/*!
	\headerfile ARandomBook
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2020 at 15:47:06
	\endlist
*/
// ----------------------------------------------------------
#ifndef ARANDOMBOOK_H
#define ARANDOMBOOK_H

// System includes
#include <string>
#include <vector>

// Application includes
#include "aglobal.hpp"

// Constants and definitions


using namespace std;

class ARandomBook {

	public:

		ARandomBook(void);
		~ARandomBook(void);

		void mEncrypt(string inString);
		void mDecrypt(std::vector<char> inData);

	private:

		string pPath = "";
		string pFileDecrypted = pPath + "/ARandomBook.string";
		string pFileEncrypted = pPath + "/ARandomBook.ecrypted";
		string pFileKey = pPath + "/ARandomBook.key";
};

#endif // ARANDOMBOOK_H

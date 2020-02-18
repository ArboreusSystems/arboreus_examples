// ----------------------------------------------------------
/*!
	\headerfile AStaticTable
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/02/2020 at 12:47:11
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASTATICTABLE_H
#define ASTATICTABLE_H

// System includes
#include <iostream>
#include <string>
#include <list>

// Application includes
#include "aglobal.h"
#include "astatictabledatamodels.h"

// Constants and definitions
#define A_DEMO_TEXT "Hello encrypted world!!!"
#define A_DEMO_LENGTH_OF_VALUE 4

// Class definitions
class AStaticTable {

	public:

		AStaticTable(void);
		~AStaticTable(void);

		static std::string mEncrypt(std::string inText);
		static std::string mDecrypt(std::string inText);

	private:

		std::list<AStaticTableKeyValue> pKey;

		static std::string mCreateNumber(char inChar,int inLength);
		static std::string mCreateChar(std::string inNumber);
};

#endif // ASTATICTABLE_H

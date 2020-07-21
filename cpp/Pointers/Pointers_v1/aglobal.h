// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/07/2020 at 05:37:55
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <string>
#include <iostream>

// Application includes
#include "alogger.h"

// Constants and definitions
enum class ADataType {

	Integer = 0,
	Float,
	Char
};

using namespace std;

// Class definitions
class AGlobal {

	public:

		AGlobal(void);
		~AGlobal(void);

		static void mPrintValue(string inName,void* inPointer,ADataType inType);
};

#endif // AGLOBAL_H

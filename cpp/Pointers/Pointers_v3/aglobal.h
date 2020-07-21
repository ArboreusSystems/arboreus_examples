// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/07/2020 at 17:32:48
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <string>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace
using namespace std;

// Class definitions
class AGlobal {

	public:

		AGlobal(void);
		~AGlobal(void);

		void mTestMethod(void);
		void mTestMethodWithParameter(string inString);
		static void mTestStaticMethod(void);
};

#endif // AGLOBAL_H

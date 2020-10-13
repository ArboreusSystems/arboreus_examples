// ----------------------------------------------------------
/*!
	\headerfile AObjectB
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 06:31:48
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTB_H
#define AOBJECTB_H

// System includes
#include <iostream>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace
using namespace std;

// Classes
class AObjectA;

// Class definitions
class AObjectB {

	public:

		AObjectA* pObjectA = nullptr;

		AObjectB(void);
		virtual ~AObjectB(void);

		string mTestString(void);

	private:

		string pTestString = "AObjectB test string";
};

#endif // AOBJECTB_H

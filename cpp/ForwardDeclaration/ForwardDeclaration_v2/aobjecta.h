// ----------------------------------------------------------
/*!
	\headerfile AObjectA
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 06:31:20
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTA_H
#define AOBJECTA_H

// System includes
#include <iostream>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace
using namespace std;

// Classes
class AObjectB;

// Class definitions
class AObjectA {


	public:

		AObjectB* pObjectB = nullptr;

		AObjectA(void);
		virtual ~AObjectA(void);

		string mTestString(void);

	private:

		string pTestString = "AObjectA test string";
};

#endif // AOBJECTA_H

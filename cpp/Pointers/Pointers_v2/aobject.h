// ----------------------------------------------------------
/*!
	\headerfile AObject
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/07/2020 at 12:35:45
	\endlist
*/
// ----------------------------------------------------------
#ifndef AOBJECT_H
#define AOBJECT_H

// System includes
#include <iostream>
#include <string>
#include <memory>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace
using namespace std;


// Class definitions
class AObject {

	public:

		AObject(void);
		AObject(string inName);
		~AObject(void);

		void mTestMethod(void);

	private:

		string pName = "Default name";
};

#endif // AOBJECT_H

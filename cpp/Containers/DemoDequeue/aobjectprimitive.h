// ----------------------------------------------------------
/*!
	\headerfile AObjectPrimitive
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/01/2020 at 23:56:41
	\endlist
*/
// ----------------------------------------------------------
#ifndef AOBJECTPRIMITIVE_H
#define AOBJECTPRIMITIVE_H

// System includes
#include <iostream>
#include <string>

// Application includes
#include "aglobal.h"

// Constants and defintions


class AObjectPrimitive {

	public:

		virtual std::string mGetTestString(void) const = 0;
		virtual void mSetTestString(std::string inString) const = 0;

	private:

		std::string pTestString = A_DEFAULT_STRING;
};

#endif // AOBJECTPRIMITIVE_H

// ----------------------------------------------------------
/*!
	\headerfile AObject1
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2020 at 14:05:45
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECT1_H
#define AOBJECT1_H

// System includes

// Application includes
#include "aobject.h"

// Constants and definitions

// Namespace

// Class definitions
class AObject1 : public AObject {

	public:

		AObject1(void);
		virtual ~AObject1(void);

		AObjectType mGetType(void);
		void mTestMethod1(void);
};

#endif // AOBJECT1_H

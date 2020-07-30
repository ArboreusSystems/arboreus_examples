// ----------------------------------------------------------
/*!
	\headerfile AObject2
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2020 at 14:13:10
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECT2_H
#define AOBJECT2_H

// System includes

// Application includes
#include "aobject.h"

// Constants and definitions

// Namespace

// Class definitions
class AObject2 : public AObject {

	public:

		AObject2(void);
		virtual ~AObject2(void);

		AObjectType mGetType(void);
		void mTestMethod2(void);
};

#endif // AOBJECT2_H

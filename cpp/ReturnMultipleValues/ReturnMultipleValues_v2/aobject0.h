// ----------------------------------------------------------
/*!
	\headerfile AObject0
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2020 at 13:58:32
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECT0_H
#define AOBJECT0_H

// System includes

// Application includes
#include "aobject.h"

// Constants and definitions

// Namespace

// Class definitions
class AObject0 : public AObject {

	public:

		AObject0(void);
		virtual ~AObject0(void);

		AObjectType mGetType(void);
		void mTestMethod0(void);
};

#endif // AOBJECT0_H

// ----------------------------------------------------------
/*!
	\headerfile AObject3
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2020 at 14:15:12
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECT3_H
#define AOBJECT3_H

// System includes

// Application includes
#include "aobject.h"

// Constants and definitions

// Namespace

// Class definitions
class AObject3 : public AObject {

	public:

		AObject3(void);
		virtual ~AObject3(void);

		AObjectType mGetType(void);
		void mTestMethod3(void);
};

#endif // AOBJECT3_H

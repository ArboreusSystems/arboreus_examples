// ----------------------------------------------------------
/*!
	\headerfile AObjectB
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 07:01:32
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTB_H
#define AOBJECTB_H

// System includes

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace

// Classes
class AObjectA;

// Class definitions
class AObjectB {

	public:

		AObjectA* pObjectA = nullptr;

		AObjectB(void);
		AObjectB(AObjectA* inObjectA);
		virtual ~AObjectB(void);
};

#endif // AOBJECTB_H

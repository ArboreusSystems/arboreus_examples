// ----------------------------------------------------------
/*!
	\headerfile AObjectA
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 07:01:06
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTA_H
#define AOBJECTA_H

// System includes

// Application includes
#include "alogger.h"
#include "aobjectb.h"

// Constants and definitions

// Namespace
using namespace std;

// Classes

// Class definitions
class AObjectA {

	public:

		AObjectB* pObjectB = nullptr;

		AObjectA(void);
		virtual ~AObjectA(void);
};

#endif // AOBJECTA_H

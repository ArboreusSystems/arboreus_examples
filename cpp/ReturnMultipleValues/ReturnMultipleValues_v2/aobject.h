// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2020 at 13:49:52
	\endlist
*/
// ----------------------------------------------------------
#ifndef AOBJECT_H
#define AOBJECT_H

// System includes

// Application includes
#include "aobjectdatamodels.h"
#include "alogger.h"

// Constants and defintions

// Namespace
using namespace std;


class AObject {

	public:

		virtual AObjectType mGetType(void) = 0;
};


#endif // AOBJECT_H

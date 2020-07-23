// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/07/2020 at 16:10:54
	\endlist
*/
// ----------------------------------------------------------
#ifndef MAINDATAMODELS_H
#define MAINDATAMODELS_H

// System includes

// Application includes
#include "aobject1.h"
#include "aobject2.h"
#include "aobject3.h"

// Constants and defintions
enum AUnionType {

	Undefined, One, Two, Three
};

union AUnion {

	AObject1* pOne;
	AObject2* pTwo;
	AObject3* pThree;
};

struct AUnionValue {

	AUnionValue(AUnionType inType,AUnion inData) {

		pType = inType;
		pData = inData;
	}

	AUnionType pType = AUnionType::Undefined;
	AUnion pData;
};

#endif // MAINDATAMODELS_H

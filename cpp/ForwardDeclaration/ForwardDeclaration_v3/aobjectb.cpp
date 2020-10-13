// ----------------------------------------------------------
/*!
	\class AObjectB
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 07:01:32
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjectb.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectB::AObjectB(void) {

	ALOG << "AObjectB created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectB::AObjectB(AObjectA* inObjectA) {

	pObjectA = inObjectA;
	ALOG << "AObjectB created with reference onto AObjectA" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectB::~AObjectB(void) {

	ALOG << "AObjectB deleted" << endl;
}


// ----------------------------------------------------------
/*!
	\class AObjectA
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 07:01:06
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjecta.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectA::AObjectA(void) {

	this->pObjectB = new AObjectB(this);
	ALOG << "AObjectA created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectA::~AObjectA(void) {

	ALOG << "AObjectA deleted" << endl;
}

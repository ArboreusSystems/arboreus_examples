// ----------------------------------------------------------
/*!
	\class ASwift
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/12/2022 at 23:00:14
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aswift.h"


// -----------
/*!
	\fn

	Doc.
*/

ASwift::ASwift(QObject* parent) : QObject(parent) {

	_A_DEBUG << "ASwift created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASwift::~ASwift(void) {

	_A_DEBUG << "ASwift deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASwift::mInit(void) {

	pIOSNative = new ASwiftIOSNative(this);

	_A_DEBUG << "ASwift initiated";
}


// -----------
/*!
	\fn

	Doc.
*/


QString ASwift::mString(void) {

	return pIOSNative->mString();
}

// ----------------------------------------------------------
/*!
	\class AUIConstants
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/11/2021 at 19:02:07
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "auiconstants.h"


// -----------
/*!
	\fn

	Doc.
*/

AUIConstants::AUIConstants(QObject *parent) : QObject(parent) {

	_A_DEBUG << "AUIConstants deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

AUIConstants::~AUIConstants(void) {

	_A_DEBUG << "AUIConstants created";
}


// -----------
/*!
	\fn

	Doc.
*/

int AUIConstants::mElementHight(void) {

	return pElementHight;
}


// -----------
/*!
	\fn

	Doc.
*/

int AUIConstants::mFontBodySize(void) {

	return pFontBodySize;
}


// -----------
/*!
	\fn

	Doc.
*/

int AUIConstants::mFontHeaderSize(void) {

	return pFontHeaderSize;
}


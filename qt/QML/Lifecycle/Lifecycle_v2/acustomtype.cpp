// ----------------------------------------------------------
/*!
	\class ACustomType
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/09/2020 at 12:47:07
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "acustomtype.h"


// -----------
/*!
	\fn

	Doc.
*/

ACustomType::ACustomType(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "ACustomType created";
}


// -----------
/*!
	\fn

	Doc.
*/

ACustomType::~ACustomType(void) {

	ALOG_SYSTEM << "ACustomType deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ACustomType::mAction(void) {

	mStep1();
	mStep2();
	mStep3();
}


// -----------
/*!
	\fn

	Doc.
*/

void ACustomType::mStep1(void) {

	emit sgStep1();
}


// -----------
/*!
	\fn

	Doc.
*/

void ACustomType::mStep2(void) {

	emit sgStep2();
}


// -----------
/*!
	\fn

	Doc.
*/

void ACustomType::mStep3(void) {

	emit sgStep3();
}

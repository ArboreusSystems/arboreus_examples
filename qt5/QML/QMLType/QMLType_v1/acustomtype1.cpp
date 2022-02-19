// ----------------------------------------------------------
/*!
	\class ACustomType1
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/09/2020 at 17:15:09
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "acustomtype1.h"


// -----------
/*!
	\fn

	Doc.
*/

ACustomType1::ACustomType1(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

ACustomType1::~ACustomType1(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void ACustomType1::mEmitSignal(void) {

	emit sgTest();
}


// -----------
/*!
	\fn

	Doc.
*/

void ACustomType1::mEmitSignalWithParameter(QVariant inValue) {

	ALOG_SYSTEM << "mEmitSignalWithParameter:" << inValue;
}

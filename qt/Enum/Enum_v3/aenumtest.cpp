// ----------------------------------------------------------
/*!
	\class AEnumTest
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/05/2021 at 12:37:10
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aenumtest.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

AEnumTest::AEnumTest(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

AEnumTest::~AEnumTest(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void AEnumTest::mPrintEnum(EnumExample::Values inEnumValue) {

	ALOG << "PrintEnum:" << inEnumValue;
}


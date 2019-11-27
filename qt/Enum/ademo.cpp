// ----------------------------------------------------------
/*!
	\class ADemo
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/11/2019 at 10:29:50
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "ademo.h"


// -----------
/*!
	\fn

	Doc.
*/

ADemo::ADemo(QObject *parent) : QObject(parent) {

	aLOG << "ADemo: created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADemo::~ADemo(void) {

	aLOG << "ADemo: deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADemo::mTestEnum1(AEnum1::List1 inEnumValue) {

	aLOG << "AEnum1::List1 value from QML:" << inEnumValue;
}


// -----------
/*!
	\fn

	Doc.
*/

void ADemo::mTestEnum2(AEnum2::List2 inEnumValue) {

	aLOG << "AEnum2::List2 value from QML:" << inEnumValue;
}

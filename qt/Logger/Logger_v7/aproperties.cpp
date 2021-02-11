// ----------------------------------------------------------
/*!
	\class AProperties
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2021 at 14:27:27
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aproperties.h"


// -----------
/*!
	\fn

	Doc.
*/

AProperties::AProperties(QObject *parent) : QObject(parent) {

	A_CONSOLE_DEBUG("AProperties created");
}


// -----------
/*!
	\fn

	Doc.
*/

AProperties::~AProperties(void) {

	A_CONSOLE_DEBUG("AProperties deleted");
}


// -----------
/*!
	\fn

	Doc.
*/

AProperties& AProperties::mInstance(void) {
	static AProperties oInstance;
	return oInstance;
}

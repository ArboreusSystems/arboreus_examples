// ----------------------------------------------------------
/*!
	\class AProperties
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/03/2021 at 13:21:12
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aproperties.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

AProperties::AProperties(QObject *parent) : QObject(parent) {

	A_CONSOLE_MESSAGE_DEBUG("AProperties created");
}


// -----------
/*!
	\fn

	Doc.
*/

AProperties::~AProperties(void) {

	A_CONSOLE_MESSAGE_DEBUG("AProperties deleted");
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

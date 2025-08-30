// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/08/2025 at 08:58:52
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

ABackend::ABackend(QObject* parent) : QObject{parent} {

	_A_DEBUG << "ABackend created";
}


// -----------
/*!
	\fn

	Doc.
*/

ABackend::~ABackend(void) {

	_A_DEBUG << "ABackend deleted";
}


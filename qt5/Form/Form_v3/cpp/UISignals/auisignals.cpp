// ----------------------------------------------------------
/*!
	\class AUISignals
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/02/2022 at 14:28:10
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "auisignals.h"


// -----------
/*!
	\fn

	Doc.
*/

AUISignals::AUISignals(QObject *parent) : QObject(parent) {

	_A_DEBUG << "AUISignals created";
}


// -----------
/*!
	\fn

	Doc.
*/

AUISignals::~AUISignals(void) {

	_A_DEBUG << "AUISignals deleted";
}


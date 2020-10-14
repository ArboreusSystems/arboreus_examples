// ----------------------------------------------------------
/*!
	\class AModule3
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 10:04:51
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "amodule3.h"

// Namespace
using namespace ARB;

// Forwarded classes
#include "../Main/abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

AModule3::AModule3(QObject *parent) : AObjectTemplate(parent) {

	ALOG_SYSTEM << "AModule3 created";
}


// -----------
/*!
	\fn

	Doc.
*/

AModule3::~AModule3(void) {

	ALOG_SYSTEM << "AModule3 deleted";
}


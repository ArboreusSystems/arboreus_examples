// ----------------------------------------------------------
/*!
	\class AModule4
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 10:10:14
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "amodule4.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

AModule4::AModule4(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "AModule4 created";
}


// -----------
/*!
	\fn

	Doc.
*/

AModule4::~AModule4(void) {

	ALOG_SYSTEM << "AModule4 deleted";
}


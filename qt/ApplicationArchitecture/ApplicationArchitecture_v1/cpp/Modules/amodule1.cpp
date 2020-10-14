// ----------------------------------------------------------
/*!
	\class AModule1
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 09:25:21
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "amodule1.h"

// Namespace
using namespace ARB;

// Forwarded classes
#include "../Main/abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

AModule1::AModule1(QObject *parent) : AObjectTemplate(parent) {

	ALOG_SYSTEM << "AModule1 created";
}


// -----------
/*!
	\fn

	Doc.
*/

AModule1::~AModule1(void) {

	ALOG_SYSTEM << "AModule1 deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AModule1::mTestMethod(void) {

	ALOG_SYSTEM << "AModule1 test method";
}

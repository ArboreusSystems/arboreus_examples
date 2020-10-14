// ----------------------------------------------------------
/*!
	\class AModule2
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 09:32:53
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "amodule2.h"

// Namespace
using namespace ARB;

// Forwarded classes
#include "../Main/abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

AModule2::AModule2(QObject *parent) : AObjectTemplate(parent) {

	pModule4 = new AModule4(this);

	ALOG_SYSTEM << "AModule2 created";
}


// -----------
/*!
	\fn

	Doc.
*/

AModule2::~AModule2(void) {

	ALOG_SYSTEM << "AModule2 deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AModule2::mTestMethod(void) {

	ALOG_SYSTEM << "AModule2 test method";
}


// -----------
/*!
	\fn

	Doc.
*/

void AModule2::mDelete(void) {

	this->deleteLater();
}

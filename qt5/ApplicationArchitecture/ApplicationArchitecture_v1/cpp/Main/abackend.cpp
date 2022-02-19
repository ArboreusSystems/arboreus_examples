// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 21:06:00
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "abackend.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

ABackend::ABackend(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "ABackend created";
}


// -----------
/*!
	\fn

	Doc.
*/

ABackend::~ABackend(void) {

	delete pLogger;
	delete pModule1;
	pModule2->mDelete();
	pModule3->deleteLater();

	ALOG_SYSTEM << "ABackend deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mSetup(void) {

	pLogger = new ALogger();
	pModule1 = new AModule1();
	pModule2 = &AModule2::mInstance();
	pModule3 = &AModule3::mInstance();
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mTestMethod(void) {

	ALOG_SYSTEM << "ABackend test method";
}

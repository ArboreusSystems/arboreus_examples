// ----------------------------------------------------------
/*!
	\class AObjectTemplate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 10/02/2021 at 21:21:21
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjecttemplate.h"

// Forwarded classes
#include "abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectTemplate::AObjectTemplate(QObject* parent) : QObject(parent) {

	pBackend = &ABackend::mInstance();
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectTemplate::~AObjectTemplate(void) {}


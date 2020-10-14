// ----------------------------------------------------------
/*!
	\class AObjectTemplate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 21:13:07
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjecttemplate.h"

// Namespace
using namespace ARB;

// Forwarded classes
#include "../Main/abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectTemplate::AObjectTemplate(QObject *parent) : QObject(parent) {

	pBackend = &ABackend::mInstance();
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectTemplate::~AObjectTemplate(void) {

}


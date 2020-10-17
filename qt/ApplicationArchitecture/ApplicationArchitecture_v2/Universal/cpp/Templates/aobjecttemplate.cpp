// ----------------------------------------------------------
/*!
	\class AObjectTemplate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 20:17:31
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjecttemplate.h"

// Forward classes
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


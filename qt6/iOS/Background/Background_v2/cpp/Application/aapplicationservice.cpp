// ----------------------------------------------------------
/*!
	\class AApplicationService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/05/2022 at 16:08:17
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplicationservice.h"


// -----------
/*!
	\fn

	Doc.
*/

AApplicationService::AApplicationService(QObject* parent) : AThreadServiceTemplate(parent) {

	_A_DEBUG << "AApplicationService created";
}


// -----------
/*!
	\fn

	Doc.
*/

AApplicationService::~AApplicationService(void) {

	_A_DEBUG << "AApplicationService deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationService::slInit(void) {

	_A_DEBUG << "AApplicationService initated";

	emit this->sgInitiated();
}


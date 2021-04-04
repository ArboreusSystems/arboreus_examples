// ----------------------------------------------------------
/*!
	\class ANetworkService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/04/2021 at 17:06:42
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "anetworkservice.h"


// -----------
/*!
	\fn

	Doc.
*/

ANetworkService::ANetworkService(QObject *parent) : AThreadServiceTemplate(parent) {

	ALOG << "ANetworkService created";
}


// -----------
/*!
	\fn

	Doc.
*/

ANetworkService::~ANetworkService(void) {

	ALOG << "ANetworkService deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetworkService::slInitService(void) {

	pNetworkManager = new QNetworkAccessManager(this);

	ALOG << "ANetworkService initialised";
	emit sgInitialised();
}

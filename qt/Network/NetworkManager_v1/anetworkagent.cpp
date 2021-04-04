// ----------------------------------------------------------
/*!
	\class ANetworkAgent
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/04/2021 at 10:22:41
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "anetworkagent.h"


// -----------
/*!
	\fn

	Doc.
*/

ANetworkAgent::ANetworkAgent(QObject *parent) : QObject(parent) {

	ALOG << "ANetworkAgent created";
}


// -----------
/*!
	\fn

	Doc.
*/

ANetworkAgent::~ANetworkAgent(void) {

	ALOG << "ANetworkAgent deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetworkAgent::slStartDownload(void) {

	ALOG << "File" << pURL << "downloaded";
	emit sgFinished();
}

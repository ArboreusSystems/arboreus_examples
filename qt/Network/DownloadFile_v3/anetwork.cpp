// ----------------------------------------------------------
/*!
	\class ANetwork
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/04/2021 at 16:23:19
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "anetwork.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

ANetwork::ANetwork(QObject *parent) : QObject(parent) {

	ALOG << "ANetwork created";
}


// -----------
/*!
	\fn

	Doc.
*/

ANetwork::~ANetwork(void) {

	ALOG << "ANetwork deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetwork::mInit(void) {

	pBackend = &ABackend::mInstance();
	pNetworkManager = new QNetworkAccessManager(this);

	pCacheFolder = pBackend->pProperties->mPathApplicationData() + "/NetworkCache";
	if (ADir::mEnsure(pCacheFolder)) {
		ALOG << "NetworkCache directory ensured" << pCacheFolder;
	} else {
		ALOG << "Failed to ensure NetworkCache director" << pCacheFolder;
	}

	ALOG << "ANetwork initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

bool ANetwork::mDownload(QString inURL) {

	ANetworkAgent oAgent(this->pNetworkManager,pCacheFolder,nullptr);
	oAgent.mDownload(inURL);

	return true;
}

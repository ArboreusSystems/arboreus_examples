// ----------------------------------------------------------
/*!
	\class ANetwork
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/04/2021 at 17:06:22
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

ANetwork::ANetwork(QObject *parent) : AThread<ANetworkService>(new ANetworkService,parent) {

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

void ANetwork::slInit(void) {

	pBackend = &ABackend::mInstance();

	QObject::connect(
		this,&ANetwork::sgInitService,
		this->mService(),&ANetworkService::slInitService
	);
	QObject::connect(
		this->mService(),&ANetworkService::sgInitialised,
		this,&ANetwork::slInitialised
	);

	this->start(QThread::Priority::LowestPriority);
	this->mInitService();

	ALOG << "ANetwork initialised";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetwork::mInitService(void) {

	emit sgInitService();
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetwork::slInitialised(void) {

	emit sgInitialised();
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetwork::mDownload(QString inURL) {

	AThreadObjectControllerTemplate oController;
	QEventLoop oEventLoop;

	ANetworkAgent oAgent(
		this->mService()->mGetNetworkManager(),
		pBackend->pProperties->mPathNetworkCache(),
		nullptr
	);
	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgStartAction,
		[&oAgent,&inURL](){
			oAgent.mDownload(inURL);
		}
	);
	QObject::connect(
		&oAgent,&ANetworkAgent::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	oAgent.moveToThread(this);

	emit oController.sgStartAction();
	oEventLoop.exec();
}

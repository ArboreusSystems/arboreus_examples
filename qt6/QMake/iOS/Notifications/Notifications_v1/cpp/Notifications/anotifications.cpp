// ----------------------------------------------------------
/*!
	\class ANotifications
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 21:17:23
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "anotifications.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

ANotifications::ANotifications(QObject* parent) : AThreadTemplate<ANotificationsService>(new ANotificationsService, parent) {

	this->setPriority(QThread::Priority::LowestPriority);

	QObject::connect(
		this,&ANotifications::sgInit,
		this->mService(),&ANotificationsService::slInit
	);
	QObject::connect(
		this->mService(),&ANotificationsService::sgInitiated,
		this,&ANotifications::slInitiated
	);
	QObject::connect(
		this,&ANotifications::sgAdd,
		this->mService(),&ANotificationsService::slAdd
	);

	_A_DEBUG << "ANotifications created";
}


// -----------
/*!
	\fn

	Doc.
*/

ANotifications::~ANotifications(void) {

	_A_DEBUG << "ANotifications deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANotifications::mInit(void) {

	pBackend = &ABackend::mInstance();
	pTemplates = new ANotificationsTemplates(this);

	emit this->sgInit();
}


// -----------
/*!
	\fn

	Doc.
*/

void ANotifications::mAddHandler(ANotificationModel inModel) {

	emit this->sgAdd(inModel);
}


// -----------
/*!
	\fn

	Doc.
*/

void ANotifications::slInitiated(void) {

	_A_DEBUG << "ANotifications intiated";

	emit this->sgInitiated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ANotifications::mAdd(QVariantMap inModel) {

	ANotificationModel oModel;
	oModel.mFromVariantMap(inModel);

	this->mAddHandler(oModel);
}


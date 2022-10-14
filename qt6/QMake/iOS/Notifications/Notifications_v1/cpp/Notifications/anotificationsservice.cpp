// ----------------------------------------------------------
/*!
	\class ANotificationsService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 21:20:52
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "anotificationsservice.h"


// -----------
/*!
	\fn

	Doc.
*/

ANotificationsService::ANotificationsService(QObject* parent) : AThreadServiceTemplate(parent) {

	_A_DEBUG << "ANotificationsService created";
}


// -----------
/*!
	\fn

	Doc.
*/

ANotificationsService::~ANotificationsService(void) {

	_A_DEBUG << "ANotificationsService deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANotificationsService::slInit(void) {

#if defined(Q_OS_IOS)

	pDelegate = qobject_cast<ANotificationsDelegateInterface*>(
		new ANotificationsIOSDelegate(this)
	);

#elif defined(Q_OS_ANDROID)

	pDelegate = qobject_cast<ANotificationsDelegateInterface*>(
		new ANotificationsAndroidDelegate(this)
	);

#else

#endif

	_A_DEBUG << "ANotificationsService initiated";

	emit this->sgInitiated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ANotificationsService::slAdd(ANotificationModel inModel) {

	pDelegate->mAdd(inModel);
}


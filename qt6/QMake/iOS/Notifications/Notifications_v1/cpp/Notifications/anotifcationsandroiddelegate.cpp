// ----------------------------------------------------------
/*!
	\class ANotifcationsAndroidDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 09:16:49
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "anotifcationsandroiddelegate.h"


// -----------
/*!
	\fn

	Doc.
*/

ANotifcationsAndroidDelegate::ANotifcationsAndroidDelegate(QObject *parent) : QObject(parent) {

	_A_DEBUG << "ANotifcationsAndroidDelegate deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

ANotifcationsAndroidDelegate::~ANotifcationsAndroidDelegate(void) {

	_A_DEBUG << "ANotifcationsAndroidDelegate created";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANotifcationsAndroidDelegate::mAdd(ANotificationModel inModel) {

	Q_UNUSED(inModel);

	_A_DEBUG << "Notification added";
}

